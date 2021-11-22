# Schema Inference in Hybrid Polystores
This repository is the replication package for the paper: "Schema Inference in Hybrid Polystores".

The repository contains the following resources:
- the Docker deployment repository (docker compose file and datasets) permitting to deploy the polystore presented in the 'Preliminary Evaluation' section of the paper.
- the schema inference tool (executable JAR file and configuration file)
- the preliminary evaluation of the approach
- the Metricity MongoDB dataset

## Deployment
The [deployment](deployment/) folder contains the Docker deployment resources. The Docker compose file configures the polystore defined in the 'Preliminary evaluation' section. It permits to deploy:
- the 'redisdb' Redis database with both movies and actors, and beers data
- the 'mymongo' MongoDB database with Metricity dataset

Due to the size of the data, 'classVersions.json' and 'datafileVersions.json' files are not contained in the data folder. To complete the MongoDB with both collections, please extract the files from 'metricity-collections.tar.bz2' compressed folder under [Metricity dataset](datasets/metricity/), and paste both files in [Metricity deployment folder](deployment/data/mongo-seed/metricity-collections/). 

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
Schema: northwind
```

## Schema Inference Tool
The [application](application/) folder contains the schema inference tool and a polystore configuration file. The Java application depends on that configuration file containing the following default configuration properties for the databases connections:
```
URL_1=relational.fit.cvut.cz
PORT_1=3306
DRIVER_1=mariadb
TYPE_1=sql
USER_1=guest
PASSWORD_1=relational
SCHEMA_1=northwind

URL_2=localhost
PORT_2=27100
DRIVER_2=
TYPE_2=mongo
USER_2=
PASSWORD_2=
SCHEMA_2=mymongo

URL_3=localhost
PORT_3=6300
DRIVER_3=
TYPE_3=redis
USER_3=
PASSWORD_3=
SCHEMA_3=redisdb
```

To execute the Java application, run the following command:
```java -jar database-schema-extractor.jar -extract <configuration_file_path> <output_hydra_file_path>```
with:
- <configuration_file_path>: the configuration file path containing the databases connections data
- <output_hydra_file_path>: the HyDRa output file path. The application opens or creates that file, and writes the polystore schema content into it.

For example:
```java -jar database-schema-extractor.jar -extract configuration.properties polystore.pml```

The application reads the 'configuration.properties' file to connect to the polystore's dataases, extracts the physical schemas of the different databases and generates a 'polystore.pml' HyDRa file containing the schema of the polystore.

## Evaluation
The [evaluation](evaluation/) folder contains the resources for the preliminary evaluation of our approach. It contains the generated polystore HyDRa file and the input datasets schemas references.
