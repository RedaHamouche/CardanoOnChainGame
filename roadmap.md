# Roadmap – ADA Price Guess Game

## 1. Spécifications & Architecture
- [x] Définir le concept et les règles du jeu
- [x] Choix des technos (Aiken, Node.js, React Native)
- [x] Définir l’architecture technique (contrat, backend, frontend)

## 2. Smart Contract (Aiken)
- [x] Initialiser le projet Aiken
- [x] Écrire la logique métier (montant, fenêtre horaire, unicité, timelock, frais)
- [ ] Écrire et valider les tests unitaires Aiken
- [ ] Déployer sur testnet

## 3. Backend (Node.js)
- [x] Initialiser le projet Node.js (yarn, TypeScript)
- [ ] Intégrer Blockfrost API (mock d’abord)
- [ ] Récupérer les UTxOs du contrat
- [ ] Récupérer le prix ADA/USD (oracle, CoinGecko)
- [ ] Calculer les gagnants (top 10, tie-breaker timestamp)
- [ ] Exposer l’API REST/GraphQL (leaderboard, historique, pool-size)
- [ ] Archiver l’historique des sessions
- [ ] Tests unitaires et d’intégration

## 4. Frontend (React Native)
- [x] Initialiser le projet React Native (yarn, TypeScript, Expo)
- [ ] Connexion wallet mobile (Eternl, Lace)
- [ ] Interface de pari (inputs, bouton, timer)
- [ ] Affichage leaderboard (top 10, gains, pseudo, écart)
- [ ] Historique des sessions
- [ ] Tests UI/UX

## 5. Tests & Déploiement
- [ ] Tests end-to-end (local/testnet)
- [ ] Documentation utilisateur
- [ ] Déploiement (testnet, puis mainnet)

---

**Mise à jour : 17/07/2025**

- Architecture Cardano dApp validée (frontend signe/soumet, backend lecture seule)
- Smart contract refactorisé et conforme aux règles métier
- Prochaine étape : finaliser les tests Aiken, puis backend mockable pour dev frontend
