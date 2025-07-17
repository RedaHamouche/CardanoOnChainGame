# Changelog

## Versions

### 0.2 (en cours)

- Début du développement du smart contract Aiken (logique de pari)
- Ajout de la vérification du montant (1 ADA)
- Ajout de la vérification de la fenêtre horaire (13h00–16h00 UTC-5)
- Prochaines étapes : unicité wallet/jour, TimeLock, prélèvement 1%, etc.

### 0.1 (terminée)

- Initialisation du projet principal avec `yarn init -y`
- Création de la structure de dossiers : contracts/, backend/, frontend/, docs/
- Configuration de Yarn workspaces
- Initialisation backend (TypeScript, dépendances, script de démarrage)
- Initialisation frontend (React Native, Expo, dépendances, script de démarrage)
- Initialisation du dossier contracts/ et du projet Aiken
- Ajout d'un .gitignore

---

# Journal de bord – Mise en place initiale

## Tâches effectuées

- Initialisation du projet principal avec `yarn init -y`
- Création de la structure de dossiers :
  - `contracts/` (smart contract Aiken)
  - `backend/` (Node.js backend)
  - `frontend/` (React Native app)
  - `docs/` (documentation)
- Configuration de Yarn workspaces dans le `package.json` racine
- Initialisation du backend :
  - `yarn init -y` dans `backend/`
  - Installation des dépendances : `typescript`, `ts-node`, `@types/node`, `dotenv`, `axios`
  - Ajout d'un script de démarrage TypeScript (`yarn start`)
  - Création du dossier `src/` et d'un fichier `src/index.ts`
  - Initialisation de la config TypeScript (`tsconfig.json`)
- Initialisation du frontend :
  - `yarn init -y` dans `frontend/`
  - Installation des dépendances : `react`, `react-native`, `expo`, `@react-navigation/native`
  - Ajout d'un script de démarrage TypeScript temporaire (`yarn start`)
  - Création du dossier `src/` et d'un fichier `src/index.ts`
  - Initialisation de la config TypeScript (`tsconfig.json`)
- Initialisation du dossier `contracts/` avec `yarn init -y`
- Initialisation d'un projet Aiken pour le smart contract : `aiken new top_ten_game/ada_price_guess`

---

**Prochaine étape recommandée :**

- Débuter le développement du smart contract Aiken (logique de pari)
- Débuter la structure du backend (API, intégration Blockfrost)
- Mettre en place la structure Expo pour le frontend
- Ajouter des tests de base pour chaque sous-projet
- Versionner le tout avec git (si ce n'est pas déjà fait)
