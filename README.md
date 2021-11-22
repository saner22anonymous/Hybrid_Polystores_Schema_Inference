# Schema Inference in Hybrid Polystores
This repository is the replication package for the paper: "Schema Inference in Hybrid Polystores".

The repository contains the following resources:
- the schema inference tool
- the Docker deployment file (+ databases configuration and initialisation)

## Schema Inference Tool


## Deployment
The folder contains the Docker deployment resources. The Docker compose file configures the polystore defined in the 'Preliminary evaluation' section. It permits to deploy:
- the 'redisdb' Redis database with both movies and actors, and beers data
- the 'mymongo' MongoDB database with Metricity dataset

Due to the size of the data, 'classVersions.json' and 'datafileVersions.json' files are not contained in the data folder. To complete the MongoDB with both both collections, please extract the files from 'metricity-collections.tar.bz2' compressed folder under [Metricity dataset](datasets/metricity/), and paste both files in [Metricity deployment folder](deployment/data/mongo-seed/metricity-collections/). 

To deploy the polystore, run the following Docker command from [deployment folder](deployment/):
```docker-compose up```

The 'Northwind' database is not deployed through the Docker deployment file. It is available from the the open-source project.

To consult the databases, you can use your preferred applications with the following dafault configuration:
#### MongoDB database
```
Address: localhost
Port: 27100
```
#### Redis database
```
Address: localhost
Port: 6300
```

#### MariaDB database
```
Address: relational.fit.cvut.cz
Port: 3306
User: guest
Password: relational
```
