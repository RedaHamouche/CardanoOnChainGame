use cardano/address.{Credential}
use cardano/transaction.{Transaction, OutputReference, Output}
use cardano/value.{Value, ada}
use aiken/time.{POSIXTime}

// InlineDatum structure for a bet
// {
//   "wallet": "addr1...",
//   "prediction": 0.5523,
//   "pseudo": "MoonGuy",
//   "message": "ADA to 1$ !",
//   "timestamp": 1657891234
// }

const ONE_ADA: Int = 1_000_000
const FEE_PERCENT: Int = 1 // 1%
const FEE_ADA: Int = 10_000 // 0.01 ADA (1% de 1 ADA)
const HOUR_13_UTC5: Int = 13 * 60 * 60 // 13h00 UTC-5
const HOUR_16_UTC5: Int = 16 * 60 * 60 // 16h00 UTC-5
const HOUR_12_UTC: Int = 12 * 60 * 60 // 12h00 UTC

type BetDatum {
  wallet: String,
  prediction: FixedDecimal,
  pseudo: String,
  message: String,
  timestamp: Int
}

validator guess_game {
  spend(datum: Option<Data>, redeemer: Data, utxo: OutputReference, self: Transaction) {
    // Étape 1 : Vérifier que le montant envoyé est exactement 1 ADA
    let utxo_output: Output = Transaction.output(self, utxo)
    let value: Value = Output.value(utxo_output)
    let ada_amount: Int = Value.amount_of(value, ada)
    if ada_amount != ONE_ADA {
      error("Bet must be exactly 1 ADA")
    }

    // Étape 2 : Vérifier la fenêtre horaire (13h00–16h00 UTC-5)
    let bet_datum: BetDatum = datum.expect("Datum required").deserialize()
    let bet_time: Int = bet_datum.timestamp
    let tx_time: POSIXTime = Transaction.valid_range(self).lower
    let tx_seconds: Int = POSIXTime.to_unix_seconds(tx_time)
    let day_start: Int = tx_seconds - (tx_seconds % 86400)
    let window_start: Int = day_start + HOUR_13_UTC5
    let window_end: Int = day_start + HOUR_16_UTC5
    if bet_time < window_start || bet_time > window_end {
      error("Bet must be placed between 13:00 and 16:00 UTC-5")
    }

    // Étape 3 : Vérifier l'unicité du pari (1 pari par wallet et par jour)
    // Limitation : la vérification complète de l'unicité doit être faite off-chain (backend),
    // car le smart contract ne peut pas scanner tous les UTxOs existants sur la blockchain.
    // Ici, on ne peut que vérifier l'unicité dans la transaction courante (prévention de double spend immédiat).
    let wallet = bet_datum.wallet
    let count = Transaction.inputs(self)
      .filter(fn(input) {
        let input_datum: Option<Data> = Output.datum(Transaction.input(self, input))
        match input_datum {
          Some(d) => {
            let d_bet: BetDatum = d.deserialize()
            d_bet.wallet == wallet && d_bet.timestamp == bet_time
          }
          None => false
        }
      })
      .length()
    if count > 1 {
      error("Only one bet per wallet per day allowed (enforced off-chain)")
    }

    // Étape 4 : TimeLock jusqu'au lendemain 12h00 UTC
    // On vérifie que la transaction ne peut être validée qu'après le TimeLock
    // Calcul du timestamp du lendemain 12h00 UTC
    let bet_day_start: Int = bet_time - (bet_time % 86400)
    let unlock_time: Int = bet_day_start + 86400 + HOUR_12_UTC // lendemain 12h00 UTC
    let tx_valid_from: Int = POSIXTime.to_unix_seconds(Transaction.valid_range(self).lower)
    if tx_valid_from < unlock_time {
      error("Funds are timelocked until 12:00 UTC the next day")
    }

    // Étape 5 : Prélèvement automatique de 1% pour l'application
    // On vérifie qu'une sortie de la transaction envoie au moins FEE_ADA à l'adresse de l'application
    // (à adapter avec la vraie adresse de l'app)
    let app_address: String = "addr1_app_fee_address" // TODO: remplacer par la vraie adresse
    let fee_paid = Transaction.outputs(self)
      .any(fn(output) {
        Output.address(output) == app_address && Value.amount_of(Output.value(output), ada) >= FEE_ADA
      })
    if !fee_paid {
      error("1% fee must be paid to the app")
    }

    // Toutes les vérifications sont passées
    // Le pari est valide et verrouillé jusqu'à la résolution
    // Distribution des gains : off-chain dans le MVP
    // (aucune logique de distribution ici)
  }
} 