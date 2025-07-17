import axios from 'axios';

const BLOCKFROST_API_KEY = process.env.BLOCKFROST_API_KEY;
const BLOCKFROST_API_URL = 'https://cardano-mainnet.blockfrost.io/api/v0'; // Adapter pour testnet si besoin

if (!BLOCKFROST_API_KEY) {
  throw new Error('BLOCKFROST_API_KEY is not set in environment variables');
}

export async function getScriptUtxos(scriptAddress: string) {
  const res = await axios.get(`${BLOCKFROST_API_URL}/addresses/${scriptAddress}/utxos`, {
    headers: { project_id: BLOCKFROST_API_KEY }
  });
  return res.data;
}

// Autres fonctions Blockfrost à ajouter ici (getTx, getDatum, etc.) 