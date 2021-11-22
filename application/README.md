The Java application is stored on [figshare](https://figshare.com/s/4078fa3d9783a536ec25) due to its size.

Download the schema inference tool, edit the 'configuration.properties' file is necessary, and execute the application using the command:
```java -jar database-schema-extractor.jar -extract configuration.properties polystore.pml```.

The output 'polystore.pml' file contains the physical structures of the databases defined in the polystore (through the Docker compose file).
