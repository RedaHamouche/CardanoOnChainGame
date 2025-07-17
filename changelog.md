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
- Initialisation du frontend :
  - `yarn init -y` dans `frontend/`
  - Installation des dépendances : `react`, `react-native`, `expo`, `@react-navigation/native`
- Initialisation du dossier `contracts/` avec `yarn init -y`

---

**Prochaine étape recommandée :**

- Ajouter la configuration TypeScript au backend et frontend
- Initialiser le projet Aiken dans `contracts/`
- Ajouter des scripts de démarrage/test pour chaque sous-projet
- Versionner le tout avec git (si ce n'est pas déjà fait)
