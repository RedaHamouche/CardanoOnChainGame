# Changelog

## 0.3 (en cours)

### Smart Contract (Aiken)

- Projet initialisé dans `contracts/ada_price_guess`.
- Logique du validateur écrite (vérification 1 ADA, time window, timelock, 1% fee, 1 bet/jour/wallet, etc).
- ❌ Compilation échoue actuellement à cause de la déclaration des constantes globales (`const ONE_ADA`, etc). À corriger.

### Backend (Node.js/Express)

- Projet initialisé avec Express, TypeScript, Blockfrost, etc.
- API scaffoldée (leaderboard, history, pool size).
- ✅ Tests Jest fonctionnels (smoke test OK).
- Script `test` ajouté dans le `package.json`.

### Frontend (Expo/React Native)

- Projet Expo initialisé proprement.
- Config Jest/Testing Library conforme à la doc Expo.
- ✅ Tests unitaires React Native fonctionnels (test avancé sur App.js OK).
- Suppression des tests/configs temporaires.

---

## 0.2

- Début du développement du smart contract Aiken (logique de pari)
- Ajout de la vérification du montant (1 ADA)
- Ajout de la vérification de la fenêtre horaire (13h00–16h00 UTC-5)
- Vérification unicité wallet/jour (on-chain limitée, off-chain à faire)
- TimeLock jusqu’au lendemain 12h00 UTC
- Prélèvement automatique de 1% pour l’application
- **Backend** :
  - Installation et configuration Express, CORS, dotenv, nodemon
  - Intégration de Blockfrost (récupération UTxOs du smart contract)
  - Création d’un module utilitaire blockfrost.ts
  - Mise en place des routes principales de l’API REST (leaderboard, historique, pool)
  - Structure prête pour l’implémentation métier

## 0.1

- Initialisation du projet principal avec `yarn init -y`
- Création de la structure de dossiers : contracts/, backend/, frontend/, docs/
- Configuration de Yarn workspaces
- Initialisation backend (TypeScript, dépendances, script de démarrage)
- Initialisation frontend (React Native, Expo, dépendances, script de démarrage)
- Initialisation du dossier contracts/ et du projet Aiken
- Ajout d'un .gitignore

---

**_Prochaine étape recommandée_**

Corriger la déclaration des constantes dans le smart contract Aiken pour permettre la compilation.

- Déplacer les constantes dans le corps du validator ou utiliser la syntaxe supportée par la version d’Aiken.
- Relancer `aiken check` pour valider la compilation.
