# Projet DataLite

**DataLite** regroupe les fichiers nécessaires pour initialiser et alimenter les bases de données **MySQL** et **MongoDB** utilisées par les autres projets (InfraEngine, Wheeltrip, Datamedia, etc.).

---

## Arborescence

```
.
├── mongodb/
│   └── import/
│       ├── transports.json   # Données JSON à importer dans MongoDB
│       └── voyages.json      # Données JSON à importer dans MongoDB
├── mysql/
│   └── import/
│       ├── 1_tables_init.sql # Script de création des tables
│       └── 2_data_init.sql   # Script d’insertion de données
└── README.md
```

---

## Prérequis

- **MySQL** ≥ 8.x ou un conteneur MySQL déjà en cours d’exécution.
- **MongoDB** ≥ 6.x ou un conteneur MongoDB déjà en cours d’exécution.
- Accès à la ligne de commande (`mysql`, `mongosh` ou `mongoimport`).

---

## Initialisation MySQL

### 1. Créer les tables

Depuis le répertoire `mysql/import` :
```bash
mysql -u <utilisateur> -p -h <hôte> <nom_bdd> < 1_tables_init.sql
```

### 2. Insérer les données initiales
```bash
mysql -u <utilisateur> -p -h <hôte> <nom_bdd> < 2_data_init.sql
```

Exemple :
```bash
mysql -u root -p -h localhost wheeltrip < 1_tables_init.sql
mysql -u root -p -h localhost wheeltrip < 2_data_init.sql
```

---

## Initialisation MongoDB

Les fichiers JSON peuvent être importés avec `mongoimport`.

Exemple :
```bash
mongoimport --db datalite --collection transports --file mongodb/import/transports.json --jsonArray
mongoimport --db datalite --collection voyages --file mongodb/import/voyages.json --jsonArray
```

Vérifier ensuite dans `mongosh` :
```bash
use datalite
show collections
```

---

## Intégration avec Docker

Si vous utilisez les services définis dans **InfraEngine** :
- Montez `mysql/import/` comme volume dans le conteneur MySQL pour initialiser automatiquement la base.
- Montez `mongodb/import/` dans le conteneur MongoDB et exécutez `mongoimport` via un script d’initialisation ou un job.

Exemple pour MySQL dans un `docker-compose.yml` :
```yaml
services:
  mysql:
    image: mysql:8
    environment:
      MYSQL_ROOT_PASSWORD: root_secret
      MYSQL_DATABASE: wheeltrip
    volumes:
      - ./mysql/import:/docker-entrypoint-initdb.d
```

---

## Bonnes pratiques

- Ne pas modifier directement les fichiers `import/` en production.
- Versionner séparément les jeux de données de test et de production.
- Garder un ordre logique dans les scripts SQL (`1_tables_init.sql` avant `2_data_init.sql`).
- Utiliser des jeux de données réduits pour les environnements de développement.

---

## Ressources utiles

- [Documentation MySQL](https://dev.mysql.com/doc/)
- [Documentation MongoDB](https://www.mongodb.com/docs/)

