## Biml With Custom C# Classes

### Required tools

In order to build and run the samples you will need the following:

* Visual Studio 2015 with update 3. The [free community edition](https://go.microsoft.com/fwlink/?LinkId=691978&clcid=0x409) is fine

* [SQL Server Data Tools (SSDT)](https://msdn.microsoft.com/en-us/mt186501) 

* [BimlExpress from Varigence](https://www.varigence.com/BimlExpress)

If installing, first install Visual Studio 2015 making sure you have the latest patches. Then install SSDT and finally Biml Express.

Now you can open the solution in Visual Studio, build it and play with the code.

### Getting set up

You will need to deploy the database project to a SQL Server. You can use localdb, developer edition or any other edition of SQL Server.
Once you have an appropriate server, open the "DEVELOPMENT_CRM_Database.publish.xml" in the CRM_Database project and modify the connection for your server and publish. This will create the test CRM database, with all the required tables/

Before you can build your SSIS Packages from the BimlScript you will need some metadata. You can run the script "Metadata Configuration.sql" in the root of the solution which will add metadata for two flat file feeds.


