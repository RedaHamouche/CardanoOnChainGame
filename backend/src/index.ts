import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config(); // charge .env si présent

import { getScriptUtxos } from './blockfrost';
import router from './routes';

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', router);

app.get('/', (req, res) => {
  res.send('ADA Price Guess Game backend is running!');
});

// Route pour récupérer les UTxOs d'un script
app.get('/utxos/:address', async (req, res) => {
  try {
    const utxos = await getScriptUtxos(req.params.address);
    res.json(utxos);
  } catch (err) {
    const message = (err instanceof Error) ? err.message : String(err);
    res.status(500).json({ error: message });
  }
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Backend API listening on port ${PORT}`);
});
