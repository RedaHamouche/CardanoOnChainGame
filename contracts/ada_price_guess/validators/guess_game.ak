use cardano/transaction.{OutputReference, Redeemer, Transaction}

pub type BetDatum {
  wallet: ByteArray,
  prediction: Int,
  pseudo: ByteArray,
  message: ByteArray,
  timestamp: Int,
}

validator guess_game {
  spend(
    datum: Option<BetDatum>,
    _redeemer: Redeemer,
    _utxo: OutputReference,
    _tx: Transaction,
  ) {
    expect Some(_d) = datum
    True
  }

  else(_) {
    fail
  }
}
