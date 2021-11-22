The schema inference tool generates a HyDRa file containing the polystore physical schema.

In order to preliminary evualate our approach, it is possible to compare the results with the input datasets documentation containing the schemas definitions.

The 'Northwind' MariaDB database schema is available as a SVG file at [Northwind](https://relational.fit.cvut.cz/assets/img/datasets-generated/northwind.svg).

The 'Metricity' MongoDB database schema is available as a JSON file in the [application](../datasets/metricity/schema.json) folder.

The 'movie' and 'beers' Redis databases schemas are available on the following GitHub repositories:
- [Movies](https://github.com/Redis-Developer/redis-datasets/tree/movie-dataset/movie-database)
- [Beers](https://github.com/Redis-Developer/redis-datasets/tree/master/redisearch/openbeerdb)

Based on these datasets, the schema inference tool has generated the [polystore](polystore.pml) HyDRa file. It contains the following physical structures (inferred from the polystore's databases):
- 13 'Northwind' MariaDB physical structures, including 'Orders', 'Products', 'Categories', 'Shippers', 'Employees', 'Territories', 'CustomerDemographics', 'CustomerCustomerDemo', 'Suppliers', 'EmployeeTerritories', 'Customers', 'Region' and 'Order Details' tables,
- 17 'Metricity' MongoDB physical structures, including 'tableHistories', 'databaseVersions', 'repositoryVersions', 'datafileHistories', 'binaryVersions', 'repositoryHistories', 'packageVersions', 'repositories', 'tableVersions', 'databaseHistories', 'packageHistories', 'commits', 'binaryHistories', 'classHistories', 'classVersions', 'tableAccess' and 'datafileVersions' collections,
- 7 Redis key-value physical structures, including 'movie' and 'actor', and 'brewery', 'style', 'brewery_geocode', 'category' and 'beer' structures.

The output HyDRa file correctly inferred the physical structures of the input datasets and their attributes. It also inferred the attributes primitive and complex (embedded) types.
