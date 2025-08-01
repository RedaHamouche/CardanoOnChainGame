use aiken/collection/list
use cardano/assets
use cardano/transaction.{
  Input, Output, OutputReference, Redeemer, Transaction, ValidityRange,
}

pub type BetDatum {
  wallet: ByteArray,
  prediction: Int,
  pseudo: ByteArray,
  message: ByteArray,
  timestamp: Int,
}

// Helper pour UTC-5 (heure locale = UTC - 5h)
fn is_in_bet_window(validity_range: ValidityRange) -> Bool {
  when validity_range is {
    ValidityRange.Interval {
      lower_bound: Bound.Finite(lower_time),
      upper_bound: _,
    } -> {
      let lower_sec = lower_time / 1000
      let local = lower_sec - 5 * 3600
      let seconds_in_day = 86400
      let seconds_since_midnight = local % seconds_in_day
      let hour = seconds_since_midnight / 3600
      hour >= 13 && hour < 16
    }
    _ -> False
  }
}

validator guess_game {
  spend(
    datum: Option<BetDatum>,
    _redeemer: Redeemer,
    utxo: OutputReference,
    tx: Transaction,
  ) {
    expect Some(bet_datum) = datum
    // Vérification de la fenêtre horaire (13h-16h UTC-5)
    expect is_in_bet_window(tx.validity_range)
    // Trouver l'input courant
    expect Some(own_input) =
      list.find(tx.inputs, fn(input: Input) { input.output_reference == utxo })
    let script_addr = own_input.output.address
    // Vérifier le montant ADA directement sur l'input
    expect assets.lovelace_of(own_input.output.value) == 1_000_000
    // Vérification qu'il n'y a qu'un seul pari par wallet par jour
    let bet_day = bet_datum.timestamp / 86400
    let same_wallet_same_day =
      tx.inputs
        |> list.filter(
            fn(input: Input) {
              when input.output.datum is {
                InlineDatum(d) ->
                  when d is {
                    bet_data ->
                      bet_data.wallet == bet_datum.wallet && bet_data.timestamp / 86400 == bet_day
                    _ -> False
                  }
                _ -> False
              }
            },
          )
        |> list.length
    expect same_wallet_same_day == 1
    // Vérifier le timelock (fonds bloqués jusqu'à 12h UTC le jour suivant)
    let bet_day_start = bet_datum.timestamp - bet_datum.timestamp % 86400
    let unlock_time = bet_day_start + 86400 + 12 * 3600
    // 12:00 UTC le jour suivant
    when tx.validity_range is {
      Interval { lower_bound: Finite(current_time), upper_bound: _ } -> {
        let current_sec = current_time / 1000
        expect current_sec >= unlock_time
      }
      _ -> fail @"Invalid validity range"
    }
    // Vérifier le paiement des frais (1% = 10,000 lovelace pour 1 ADA)
    let fee_paid =
      tx.outputs
        |> list.any(
            fn(output: Output) {
              // À adapter : vérifier si l'output va vers l'adresse de frais de l'app
              assets.lovelace_of(output.value) >= 10_000
            },
          )
    expect fee_paid
    True
  }

  else(_) {
    fail
  }
}
