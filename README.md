## Biml With Custom C# Classes

### Required tools

In order to build and run the samples you will need the following:

* Visual Studio 2015 with update 3. The [free community edition](https://go.microsoft.com/fwlink/?LinkId=691978&clcid=0x409) is fine

* [SQL Server Data Tools (SSDT)](https://msdn.microsoft.com/en-us/mt186501) 

* [BimlExpress from Varigence](https://www.varigence.com/BimlExpress)

If installing, first install Visual Studio 2015 making sure you have the latest patches. Then install SSDT and finally Biml Express.

Now you can open the solution in Visual Studio, build it and play with the code.

### Getting set up

Build the project to restore any required packages. 
_Make sure to build the release version so that the `BlackSnowUtils.dll` is in the correct place._

You will need to deploy the database project to a SQL Server. You can use (localdb)\MSSQLLocalDB or any other edition of SQL Server. If you don't use (localdb)\MSSQLLocalDB you will need to update the connection strings in `MappingUtils.cs` and `CommonVariables.biml` accordingly.

Once you have an appropriate server, open the file `DEVELOPMENT_CRM_Database.publish.xml` in the CRM_Database project and modify the connection to point at your server and publish. This will create the test CRM database, with all the required tables.

In the files `Tier1FileFormats.biml` and `Tier0Staging.biml` in the EDI_Templatefolder, update the path for the `BlackSnowUtils.dll` file to match your own setup.

Before you can build your SSIS Packages from the BimlScript you will need some metadata. You can run the script `Metadata Configuration.sql` in the root of the solution which will add metadata for two flat file feeds.


