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

## Ressources utiles

- [Documentation MySQL](https://dev.mysql.com/doc/)
- [Documentation MongoDB](https://www.mongodb.com/docs/)

