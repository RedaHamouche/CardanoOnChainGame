// Routes principales de l'API REST du backend ADA Price Guess Game
// - GET /api/session/:date/leaderboard
// - GET /api/wallet/:addr/history
// - GET /api/session/:date/pool-size
// (à compléter selon besoins)

import { Router } from 'express';

const router = Router();

// Leaderboard public pour une session (date)
router.get('/session/:date/leaderboard', (req, res) => {
  // TODO: implémenter récupération du leaderboard
  res.json({ leaderboard: [] });
});

// Historique des paris d'un wallet
router.get('/wallet/:addr/history', (req, res) => {
  // TODO: implémenter récupération de l'historique
  res.json({ history: [] });
});

// Taille du pool pour une session (date)
router.get('/session/:date/pool-size', (req, res) => {
  // TODO: implémenter récupération de la taille du pool
  res.json({ poolSize: 0 });
});

export default router; 