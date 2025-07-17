# ADA Price Guess Game – MVP

## 🎯 Vision

Jeu on-chain sur Cardano où chaque joueur parie 1 ADA pour deviner le prix ADA/USD du lendemain. Les 10 meilleurs partagent la cagnotte. Simplicité, transparence, fun.

---

## 🚦 Jalons & Roadmap

### 1. Spécifications & Architecture

- [x] Définir le concept et les règles du jeu
- [x] Choix des technos (Aiken, Node.js, React Native)
- [ ] Définir l’architecture technique (contrat, backend, frontend)

### 2. Smart Contract (Aiken)

- [ ] Initialiser le projet Aiken
- [ ] Écrire le contrat :
  - [ ] Accepter 1 ADA exact
  - [ ] Vérifier 1 pari/wallet/jour
  - [ ] Vérifier la fenêtre horaire (13h-16h UTC-5)
  - [ ] Stocker prédiction, pseudo, message, timestamp dans InlineDatum
  - [ ] TimeLock jusqu’à 12h00 UTC lendemain
  - [ ] Prélèvement 1% pour l’app
- [ ] Tester localement (simulateur, testnet)

### 3. Backend (Node.js)

- [ ] Initialiser le projet Node.js (yarn, TypeScript)
- [ ] Intégrer Blockfrost API
- [ ] Récupérer les UTxOs du contrat
- [ ] Récupérer le prix ADA/USD (oracle, CoinGecko)
- [ ] Calculer les gagnants (top 10, tie-breaker timestamp)
- [ ] Distribuer les gains off-chain
- [ ] Exposer l’API REST/GraphQL :
  - [ ] GET /session/:date/leaderboard
  - [ ] GET /wallet/:addr/history
  - [ ] GET /session/:date/pool-size
- [ ] Archiver l’historique des sessions
- [ ] Tests unitaires et d’intégration

### 4. Frontend (React Native)

- [ ] Initialiser le projet React Native (yarn, TypeScript, Expo)
- [ ] Connexion wallet mobile (Eternl, Lace)
- [ ] Interface de pari (inputs, bouton, timer)
- [ ] Affichage leaderboard (top 10, gains, pseudo, écart)
- [ ] Historique des sessions
- [ ] Tests UI/UX

### 5. Tests & Déploiement

- [ ] Tests end-to-end (local/testnet)
- [ ] Documentation utilisateur
- [ ] Déploiement (testnet, puis mainnet)

---

## 🗂️ Structure de dossier recommandée

```
top_ten_game/
├── contracts/         # Smart contract Aiken
├── backend/           # Node.js backend (API, scripts)
├── frontend/          # React Native app
├── docs/              # Documentation, specs
├── README.md
```

---

## 🏗️ Conseils d’architecture

- **Séparation stricte** : chaque brique indépendante, API claire entre elles
- **Tests locaux** : privilégier testnet Cardano, simulateurs, mocks pour backend
- **Sécurité** : valider toutes les entrées côté contrat et backend
- **Scalabilité** : prévoir la gestion de sessions/jours dans la base backend

---

## 💡 Architecture recommandée (Cardano dApp)

- Le frontend construit la transaction, l’utilisateur signe avec son wallet (Eternl, Lace, Nami, etc.) et la soumet directement à la blockchain.
- Le backend sert uniquement à exposer l’API de leaderboard, historique, récupération des prix ADA/USD, etc. (lecture seule, pas de signature de transaction utilisateur).
- Ce modèle maximise la sécurité, la décentralisation et la transparence, tout en gardant une UX fluide et crypto-native.

---

## 📝 TODOs (boussole projet)

- [ ] Initialiser la structure de dossier
- [ ] Mettre en place yarn workspaces (monorepo)
- [ ] Initialiser chaque sous-projet (contrat, backend, frontend)
- [ ] Écrire les premiers tests (contrat, backend, frontend)
- [ ] Documenter chaque étape

---

## ❓ Par quoi commencer ?

- **Option 1** : Smart contract (fondation on-chain, logique de pari)
- **Option 2** : Backend (API, logique off-chain, intégration Blockfrost)
- **Option 3** : Frontend (UI, flow utilisateur, mock API)

**Recommandation** :

1. Initialiser la structure de dossier et le monorepo (yarn workspaces)
2. Commencer par le smart contract (cœur du jeu)
3. En parallèle, poser le backend (API, intégration Blockfrost)
4. Puis le frontend (UI, intégration API)

---

## 🛠️ Mise en place locale

- Installer [Yarn](https://yarnpkg.com/)
- Installer [Aiken](https://aiken-lang.org/) (contrat Cardano)
- Installer [Node.js](https://nodejs.org/) (backend)
- Installer [Expo CLI](https://docs.expo.dev/) (frontend React Native)

---

## 📚 Ressources utiles

- [Aiken Lang](https://aiken-lang.org/)
- [Blockfrost API](https://blockfrost.io/)
- [CoinGecko API](https://www.coingecko.com/en/api)
- [React Native](https://reactnative.dev/)
- [Cardano Testnet Faucet](https://testnets.cardano.org/en/testnets/cardano/tools/faucet/)

---

**Ce README est la boussole du projet. Mets-le à jour à chaque étape !**
