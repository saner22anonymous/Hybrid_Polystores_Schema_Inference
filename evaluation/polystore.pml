relational schema myRelationalSchema : northwind {
	table Orders {
		columns {
			OrderID (int),
			CustomerID (string),
			EmployeeID (int),
			OrderDate (datetime),
			RequiredDate (datetime),
			ShippedDate (datetime),
			ShipVia (int),
			Freight (decimal),
			ShipName (string),
			ShipAddress (string),
			ShipCity (string),
			ShipRegion (string),
			ShipPostalCode (string),
			ShipCountry (string)
		}
		identifier {
			OrderID
		}
		secondary identifiers {
		}
		references {
			FK_Orders_Customers : CustomerID -> Customers.CustomerID
			FK_Orders_Employees : EmployeeID -> Employees.EmployeeID
			FK_Orders_Shippers : ShipVia -> Shippers.ShipperID
		}
		index {
			OrderDate
			ShippedDate
			ShipPostalCode
		}
	}
	table Products {
		columns {
			ProductID (int),
			ProductName (string),
			SupplierID (int),
			CategoryID (int),
			QuantityPerUnit (string),
			UnitPrice (decimal),
			UnitsInStock (smallint),
			UnitsOnOrder (smallint),
			ReorderLevel (smallint),
			Discontinued (bit)
		}
		identifier {
			ProductID
		}
		secondary identifiers {
		}
		references {
			FK_Products_Categories : CategoryID -> Categories.CategoryID
			FK_Products_Suppliers : SupplierID -> Suppliers.SupplierID
		}
		index {
			ProductName
		}
	}
	table Categories {
		columns {
			CategoryID (int),
			CategoryName (string),
			Description (text),
			Picture (blob)
		}
		identifier {
			CategoryID
		}
		secondary identifiers {
		}
		references {
		}
		index {
			CategoryName
		}
	}
	table Shippers {
		columns {
			ShipperID (int),
			CompanyName (string),
			Phone (string)
		}
		identifier {
			ShipperID
		}
		secondary identifiers {
		}
		references {
		}
		index {
		}
	}
	table Employees {
		columns {
			EmployeeID (int),
			LastName (string),
			FirstName (string),
			Title (string),
			TitleOfCourtesy (string),
			BirthDate (datetime),
			HireDate (datetime),
			Address (string),
			City (string),
			Region (string),
			PostalCode (string),
			Country (string),
			HomePhone (string),
			Extension (string),
			Photo (blob),
			Notes (text),
			ReportsTo (int),
			PhotoPath (string),
			Salary (float)
		}
		identifier {
			EmployeeID
		}
		secondary identifiers {
		}
		references {
			FK_Employees_Employees : ReportsTo -> Employees.EmployeeID
		}
		index {
			LastName
			PostalCode
		}
	}
	table Territories {
		columns {
			TerritoryID (string),
			TerritoryDescription (string),
			RegionID (int)
		}
		identifier {
			TerritoryID
		}
		secondary identifiers {
		}
		references {
			FK_Territories_Region : RegionID -> Region.RegionID
		}
		index {
		}
	}
	table CustomerDemographics {
		columns {
			CustomerTypeID (string),
			CustomerDesc (text)
		}
		identifier {
			CustomerTypeID
		}
		secondary identifiers {
		}
		references {
		}
		index {
		}
	}
	table CustomerCustomerDemo {
		columns {
			CustomerID (string),
			CustomerTypeID (string)
		}
		identifier {
			CustomerID,
			CustomerTypeID
		}
		secondary identifiers {
		}
		references {
			FK_CustomerCustomerDemo : CustomerTypeID -> CustomerDemographics.CustomerTypeID
			FK_CustomerCustomerDemo_Customers : CustomerID -> Customers.CustomerID
		}
		index {
		}
	}
	table Suppliers {
		columns {
			SupplierID (int),
			CompanyName (string),
			ContactName (string),
			ContactTitle (string),
			Address (string),
			City (string),
			Region (string),
			PostalCode (string),
			Country (string),
			Phone (string),
			Fax (string),
			HomePage (text)
		}
		identifier {
			SupplierID
		}
		secondary identifiers {
		}
		references {
		}
		index {
			CompanyName
			PostalCode
		}
	}
	table EmployeeTerritories {
		columns {
			EmployeeID (int),
			TerritoryID (string)
		}
		identifier {
			EmployeeID,
			TerritoryID
		}
		secondary identifiers {
		}
		references {
			FK_EmployeeTerritories_Territories : TerritoryID -> Territories.TerritoryID
			FK_EmployeeTerritories_Employees : EmployeeID -> Employees.EmployeeID
		}
		index {
		}
	}
	table Customers {
		columns {
			CustomerID (string),
			CompanyName (string),
			ContactName (string),
			ContactTitle (string),
			Address (string),
			City (string),
			Region (string),
			PostalCode (string),
			Country (string),
			Phone (string),
			Fax (string)
		}
		identifier {
			CustomerID
		}
		secondary identifiers {
		}
		references {
		}
		index {
			City
			CompanyName
			PostalCode
			Region
		}
	}
	table Region {
		columns {
			RegionID (int),
			RegionDescription (string)
		}
		identifier {
			RegionID
		}
		secondary identifiers {
		}
		references {
		}
		index {
		}
	}
	table Order Details {
		columns {
			OrderID (int),
			ProductID (int),
			UnitPrice (decimal),
			Quantity (smallint),
			Discount (double)
		}
		identifier {
			OrderID,
			ProductID
		}
		secondary identifiers {
		}
		references {
			FK_Order_Details_Products : ProductID -> Products.ProductID
			FK_Order_Details_Orders : OrderID -> Orders.OrderID
		}
		index {
		}
	}
}
document schema myMongoDBSchema : mymongo {
	collection tableHistories {
		fields {
			_class (string),
			_id (string),
			th_entityType (string),
			versionsId (map) {
				key (string),
				value (string)
			}
		}
	}
	collection databaseVersions {
		fields {
			_class (string),
			_id (string),
			changeType (string),
			commitSha (string),
			dbv_entityType (string),
			historyId (string),
			modifiedTableVersionsId (array[string]),
			namingData (struct) {
				entityType (string),
				oldPath (string),
				currentPath (string)
			},
			tableVersionsId (array[string]),
			tag (struct) {
				tags (array[string])
			},
			versionNumber (integer)
		}
	}
	collection repositoryVersions {
		fields {
			_class (string),
			_id (string),
			commitSha (string),
			databasesId (array[string]),
			historyId (string),
			modifiedDatabasesId (array[string]),
			modifiedPackagesId (array[string]),
			modifiedTableAccessesId (array[string]),
			packagesId (array[string]),
			tableAccessesId (array[string]),
			versionNumber (integer)
		}
	}
	collection datafileHistories {
		fields {
			_class (string),
			_id (string),
			dfh_entityType (string),
			versionsId (map) {
				key (string),
				value (string)
			}
		}
	}
	collection binaryVersions {
		fields {
			_class (string),
			_id (string),
			bv_entityType (string),
			changeType (string),
			commitSha (string),
			fileDiff (string),
			fileSize (string),
			historyId (string),
			namingData (struct) {
				currentPath (string),
				entityType (string),
				oldPath (string)
			},
			packageVersionId (string),
			tag (struct) {
				tags (array[string])
			},
			versionNumber (integer)
		}
	}
	collection repositoryHistories {
		fields {
			_class (string),
			_id (string),
			rh_entityType (string),
			versionsId (map) {
				key (string),
				value (string)
			}
		}
	}
	collection packageVersions {
		fields {
			_class (string),
			_id (string),
			binariesId (array[string]),
			childVersionId (string),
			classesId (array[string]),
			commitSha (string),
			datafilesId (array[string]),
			historyId (string),
			modifiedBinariesId (array[string]),
			modifiedClassesId (array[string]),
			modifiedDatafilesId (array[string]),
			namingData (struct) {
				entityType (string),
				currentPath (string)
			},
			parentVersionId (string),
			tag (struct) {
				tags (array[string])
			},
			versionNumber (integer)
		}
	}
	collection repositories {
		fields {
			_class (string),
			_id (string),
			beingAnalyzed (boolean),
			binaryHistoriesId (array[string]),
			classHistoriesId (array[string]),
			commitsSha1 (array[string]),
			databaseHistoriesId (array[string]),
			databaseType (string),
			datafileHistoriesId (array[string]),
			name (string),
			owner (string),
			packageHistoriesId (array[string]),
			repositoryHistoryId (array[string]),
			tableAccessesId (array[string]),
			tableHistoriesId (array[string]),
			tags (array) {
				tags (array[string])
			},
			url (string)
		}
	}
	collection tableVersions {
		fields {
			_class (string),
			_id (string),
			changeType (string),
			columns (array[string]),
			commitSha (string),
			databaseVersionId (string),
			historyId (string),
			metricData (array) {
				entityType (string),
				metricType (string),
				value (integer)
			},
			modifiedTableAccesses (array[string]),
			namingData (struct) {
				entityType (string),
				oldPath (string),
				currentPath (string)
			},
			tableAccesses (array[string]),
			tag (struct) {
				tags (array[string])
			},
			tv_entityType (string),
			versionNumber (integer)
		}
	}
	collection databaseHistories {
		fields {
			_class (string),
			_id (string),
			dbh_entityType (string),
			versionsId (struct) {
				1 (string),
				2 (string),
				3 (string),
				...
				1685 (string),
				1686 (string),
				1687 (string)
			}
		}
	}
	collection packageHistories {
		fields {
			_class (string),
			_id (string),
			pathDepthIndex (integer),
			subPackagesId (array[string]),
			versionsId (map) {
				key (string),
				value (string)
			}
		}
	}
	collection commits {
		fields {
			_class (string),
			_id (string),
			authorEmail (string),
			binaryfileVersionsId (array[string]),
			classVersionsId (array[string]),
			commitFullMessage (string),
			commitShortMessage (string),
			commitTime (timestamp),
			databaseVersionsId (array[string]),
			datafileVersionsId (array[string]),
			packageVersionsId (array[string]),
			repositoryVersionId (string),
			tableAccessesId (array[string]),
			tableVersionsId (array[string])
		}
	}
	collection binaryHistories {
		fields {
			_class (string),
			_id (string),
			bh_entityType (string),
			versionsId (struct) {
				1 (string),
                ...
				101 (string)
			}
		}
	}
	collection classHistories {
		fields {
			_class (string),
			_id (string),
			ch_entityType (string),
			versionsId (map) {
				key (string),
				value (string)
			}
		}
	}
	collection classVersions {
		fields {
			_class (string),
			_id (string),
			changeType (string),
			commitSha (string),
			cv_entityType (string),
			fileDiff (string),
			historyId (string),
			metricData (array) {
				entityType (string),
				metricType (string),
				value (integer)
			},
			modifiedTableAccessesId (array[string]),
			namingData (struct) {
				currentPath (string),
				entityType (string),
				oldPath (string)
			},
			packageVersionId (string),
			tableAccessesId (array[string]),
			tag (struct) {
				tags (array[string])
			},
			versionNumber (integer)
		}
	}
	collection tableAccess {
		fields {
			_class (string),
			_id (string),
			changeType (string),
			classVersionId (string),
			commitSha (string),
			iv_entityType (string),
			tableVersionId (string)
		}
	}
	collection datafileVersions {
		fields {
			_class (string),
			_id (string),
			changeType (string),
			commitSha (string),
			dfv_entityType (string),
			fileDiff (string),
			historyId (string),
			metricData (array) {
				entityType (string),
				metricType (string),
				value (integer)
			},
			namingData (struct) {
				currentPath (string),
				entityType (string),
				oldPath (string)
			},
			packageVersionId (string),
			tag (struct) {
				tags (array[string])
			},
			versionNumber (integer)
		}
	}
}
key value schema myRedisSchema : redisdb {
	kvpairs actor {
		key : "actor:"[id],
		value : hash {
			first_name (string),
			date_of_birth (int),
			last_name (string),
			_id (string)
		}
	}
	kvpairs movie {
		key : "movie:*" (string)
		value : hash {
			release_year (int),
			title (string),
			genre (string),
			rating (float),
			votes (int),
			_id (string)
		}
	}
	kvpairs brewery {
		key : "brewery:*" (string)
		value : hash {
			phone (string),
			_id (string),
			address2 (string),
			website (url),
			last_mod (datetime),
			filepath (string),
			descript (string),
			country (string),
			longitude (float),
			brewery_id (int),
			address1 (string),
			state (string),
			accuracy (string),
			name (string),
			city (string),
			code (string),
			latitude (float)
		}
	}
	kvpairs style {
		key : "style:*" (string)
		value : hash {
			style_name (string),
			last_mod (datetime),
			cat_id (int),
			_id (string)
		}
	}
	kvpairs brewery_geocode {
		key : "brewery_geocode:*" (string)
		value : hash {
			accuracy (string),
			latitude (float),
			brewery_id (int),
			longitude (float),
			_id (string)
		}
	}
	kvpairs category {
		key : "category:*" (string)
		value : hash {
			cat_name (string),
			last_mod (datetime),
			_id (string)
		}
	}
	kvpairs beer {
		key : "beer:*" (string),
		value : hash {
			srm (int),
			filepath (string),
			last_mod (datetime),
			upc (int),
			ibu (int),
			_id (string),
			brewery_id (int),
			abv (int),
			descript (string),
			style_id (int),
			 (string),
			name (string),
			cat_id (int)
		}
	}
}
