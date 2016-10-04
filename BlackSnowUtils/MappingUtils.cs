using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BlackSnow
{
    public class Mapping
    {

        /// <summary>
        /// Builds the columns collection for the flat file formats
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="fileId"></param>
        /// <returns></returns>
        public static string GetFileFormatColumns(string connectionName, int fileId)
        {

            var sqlQuery = @"SELECT SourceColumn, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale "
                           + " , isAttribute, AttributeTypeId, ColumnNumber, ColumnDelimiter, mf.RowDelimiter "
                           + " FROM Metadata.MappingColumn mc JOIN Metadata.MappingFile mf ON mf.FileId = mc.FileId "
                           + " WHERE mf.FileId = " + fileId
                           + " ORDER BY ColumnNumber";

            var dt = GetDataTable(connectionName, sqlQuery);
            var fileFormat = new StringBuilder();
            var columnCount = dt.Rows.Count;
            var counter = 0;
            foreach (DataRow row in dt.Rows)
            {

                // Build the <Column /> strings for the <FlatFileFormat/> element
                // The final column is delimited by the RowDelimiter rather than ColumnDelimiter
                counter++;

                fileFormat.Append("<Column Name = \"" + row["TargetColumn"]);

                if (!string.IsNullOrEmpty(row["FieldLength"].ToString()))
                {
                    fileFormat.Append("\" Length = \"" + row["FieldLength"]);
                }
                else
                {
                    if (!string.IsNullOrEmpty(row["FieldScale"].ToString()))
                    {
                        fileFormat.Append("\" Scale = \"" + row["FieldScale"]);
                    }
                }

                fileFormat.Append("\" DataType = \"" + row["TargetDataType"]);

                if (counter != columnCount)
                {
                    fileFormat.Append("\" Delimiter = \"" + row["ColumnDelimiter"]);
                }
                else
                {
                    fileFormat.Append("\" Delimiter = \"" + row["RowDelimiter"]);
                }

                fileFormat.Append("\" />" + Environment.NewLine);
            }

            return fileFormat.ToString();
        }

        /// <summary>
        /// Constructs the flat file format header for the requested feed
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="fileId"></param>
        /// <returns>String</returns>
        public static string GetFileFormatHeader(string connectionName, int fileId)
        {
            var sqlQuery = @"SELECT FeedName, RowDelimiter, CodePage, ColumnNamesInFirstDataRow, IsUnicode, FlatFileType, HeaderRowsToSkip "
                           + "FROM Metadata.MappingFile "
                           + "WHERE FileId = " + fileId;

            var dt = GetDataTable(connectionName, sqlQuery);

            var fileFormat = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                // Build the header string for the <FlatFileFormat/> element
                fileFormat.Append("Name = \"" + row["FeedName"]);

                fileFormat.Append("\" RowDelimiter = \"" + row["RowDelimiter"]);
                fileFormat.Append("\" CodePage = \"" + row["CodePage"]);
                fileFormat.Append("\" ColumnNamesInFirstDataRow = \"" +
                                  row["ColumnNamesInFirstDataRow"].ToString().ToLower());
                fileFormat.Append("\" HeaderRowsToSkip = \"" + row["HeaderRowsToSkip"]);
                fileFormat.Append("\" IsUnicode = \"" + row["IsUnicode"].ToString().ToLower());
                fileFormat.Append("\" FlatFileType = \"" + row["FlatFileType"]);

                fileFormat.Append("\" " + Environment.NewLine);
            }

            return fileFormat.ToString();
        }

        /// <summary>
        /// Gets a list of the ids of flat files for which SSIS package generation is desired
        /// </summary>
        /// <param name="connectionName"></param>
        /// <returns></returns>
        public static List<int> GetFlatFiles(string connectionName)
        {
            var sqlQuery = @"SELECT FileId FROM Metadata.MappingFile ";

            var dt = GetDataTable(connectionName, sqlQuery);

            var fileList = new List<int>();
            foreach (DataRow row in dt.Rows)
            {
                fileList.Add((int)row["FileId"]);
            }

            return fileList;
        }

        /// <summary>
        /// Gets all the required paths for entitys and attributes to build the main multicast.
        /// Also provides the AttributeTypeId for Attribute paths.
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="fileId"></param>
        /// <returns></returns>
        public static DataTable GetMulticastPaths(string connectionName, int fileId)
        {
            var sqlQuery = @"SELECT DISTINCT 'Table' AS MulticastType, TargetTable AS MulticastPath, NULL AS AttributeTypeId "
                           + "FROM Metadata.MappingColumn WHERE isAttribute = 0 AND IsPivot = 0 AND FileId = " + fileId

                           + "UNION ALL "
                           + "SELECT DISTINCT 'Attribute' AS MulticastType, TargetColumn AS MulticastPath, AttributeTypeId "
                           + "FROM Metadata.MappingColumn WHERE   isAttribute = 1 AND IsPivot = 0 AND FileId = " + fileId

                           + "UNION ALL "
                           + "SELECT DISTINCT 'UnPivot' AS MulticastType, TargetTable AS MulticastPath, NULL AS AttributeTypeId "
                           + "FROM    Metadata.MappingColumn WHERE IsPivot = 1 AND isAttribute = 0 AND FileId = " + fileId;

            return GetDataTable(connectionName, sqlQuery);
        }

        /// <summary>
        /// Gets all the required paths for unpivots to add unpivot componennts if required.
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="fileId"></param>
        /// <returns></returns>
        public static DataTable GetUnpivotEntities(string connectionName, int fileId)
        {
            var sqlQuery = @"SELECT DISTINCT 'Pivot' AS MulticastType, TargetTable "
                           + "FROM    Metadata.MappingColumn WHERE IsPivot = 1 AND FileId = " + fileId;

            return GetDataTable(connectionName, sqlQuery);
        }

        /// <summary>
        /// Return the Biml for an unpivot component
        /// </summary>
        /// <param name="connectionName">The name of the package connection to be used</param>
        /// <param name="fileId">The currently processing file</param>
        /// <param name="targetTable">The currently processing unpivot table</param>
        /// <returns></returns>
        public static string GetUnpivotComponent(string connectionName, int fileId, string targetTable)
        {
            var sqlQuery = @"SELECT DISTINCT 'UnPivot' AS MulticastType, SourceColumn, TargetColumn AS PivotKeyValue, PivotTarget AS TargetColumn, TargetDataType, FieldLength "
                           + "FROM    Metadata.MappingColumn WHERE IsPivot = 1 AND FileId = " + fileId + " AND TargetTable = '" + targetTable + "'";

            var unpivots = new StringBuilder();
            var pivotDataTable = GetDataTable(connectionName, sqlQuery);
            if (pivotDataTable.Rows.Count > 0)
            {
                unpivots.Append("<Unpivot Name=\"Unpivot " + targetTable + "\" PivotKeyValueColumnDataType =\"" + pivotDataTable.Rows[0].ItemArray[4] + "\" "
                    + " PivotKeyValueColumnName =\"PivotKey\" " + Environment.NewLine
                    + "\t\tPivotKeyValueColumnLength =\"" + pivotDataTable.Rows[0].ItemArray[5] + "\" AutoPassThrough =\"true\" > " + Environment.NewLine);

                unpivots.Append("\t<InputPath OutputPathName=\"Split Out Tables and Attributes." + targetTable + "\" />" + Environment.NewLine);

                unpivots.Append("\t<Columns>" + Environment.NewLine);

                foreach (DataRow rowData in pivotDataTable.Rows)
                {
                    unpivots.Append("\t\t<Column PivotKeyValue = \"" + rowData["PivotKeyValue"] + "\" SourceColumn = \"" + rowData["SourceColumn"]
                        + "\" TargetColumn = \"" + rowData["TargetColumn"] + "\" />" + Environment.NewLine);
                }
                unpivots.Append("\t</Columns>" + Environment.NewLine);
                unpivots.Append("</Unpivot>" + Environment.NewLine);
            }
            else
            {
                unpivots.Append("");
            }
            return unpivots.ToString();
        }

        /// <summary>
        /// Return the Biml for an unpivot component
        /// </summary>
        /// <param name="connectionName">The name of the package connection to be used</param>
        /// <param name="fileId">The currently processing file</param>
        /// <param name="targetTable">The currently processing unpivot table</param>
        /// <returns></returns>
        public static string GetUnpivotOutputField(string connectionName, int fileId, string targetTable)
        {
            var sqlQuery = @"SELECT DISTINCT PivotTarget "
                           + "FROM    Metadata.MappingColumn WHERE IsPivot = 1 AND FileId = " + fileId + " AND TargetTable = '" + targetTable + "'";

            var pivotDataTable = GetDataTable(connectionName, sqlQuery);
            return pivotDataTable.Rows.Count > 0 ? pivotDataTable.Rows[0].ItemArray[0].ToString() : "";
        }


        /// <summary>
        /// Gets a connection name that can be used by the calling Biml Script in building a flat file connection
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="fileId"></param>
        /// <returns></returns>
        public static string GetConnectionName(string connectionName, int fileId)
        {
            var sqlQuery = @"SELECT FileId, FeedName FROM Metadata.MappingFile "
                           + "WHERE FileId = " + fileId;

            return GetDataTable(connectionName, sqlQuery)
                .Rows.OfType<DataRow>()
                .Where(row => (int)row["FileId"] == fileId)
                .Select(row => row["FeedName"].ToString()).First();
        }

        /// <summary>
        /// Given a connection name, return its corresponding connection string.
        /// </summary>
        /// <param name="connectionName"></param>
        /// <returns></returns>
        private static string GetConnectionString(string connectionName)
        {
            switch (connectionName)
            {
                case "CrmAdo":
                    return GetAdoConnectionString();
                case "CrmOleDb":
                    return GetOleDbConnectionString();
                default:
                    return "";
            }
        }

        private static string GetAdoConnectionString()
        {
            // Todo Change to get this data from configuration


            return @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRM;Integrated Security=True;Connect Timeout=60;Encrypt=False;"
                    + "TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        }

        private static string GetOleDbConnectionString()
        {
            // Todo Change to get this data from configuration
            // Todo - How can I return this to the Biml without exposing the connection string?

            return @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CRM;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;";
        }


        /// <summary>
        /// Returns a data table when supplied with a connection string and a query
        /// </summary>
        /// <param name="connectionName"></param>
        /// <param name="sqlQuery"></param>
        /// <returns>DataTable</returns>
        private static DataTable GetDataTable(string connectionName, string sqlQuery)
        {
            var connectionString = GetConnectionString(connectionName);


            using (var conn = new SqlConnection(connectionString))

                try
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(sqlQuery, conn))
                    {
                        SqlDataReader sqlReader;
                        using (sqlReader = cmd.ExecuteReader())
                        {
                            using (var dt = new DataTable())
                            {
                                dt.Load(sqlReader);
                                return dt;
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    // TODO Log the error here...
                    MessageBox.Show(
                        "Error " + e);
                    return null;
                }
        }


        //private static void WriteError(Exception errorMessage, string serverName, string initialCatalog)
        //{
        //    var sqlConnectionString = @"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=" +
        //                              initialCatalog + ";Data Source=" + serverName;
        //    using (var con = new SqlConnection(sqlConnectionString))
        //    {
        //        con.Open();
        //        // Log the error
        //        using (var cmd = new SqlCommand(initialCatalog + ".log.AddDebugError", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            cmd.Parameters.Add("@FileId", SqlDbType.NVarChar).Value = "Data_Mailbox.dts error handler";
        //            cmd.Parameters.Add("@CustomerDataFileID", SqlDbType.Int).Value = -1;
        //            cmd.Parameters.Add("@ErrorMessage", SqlDbType.NVarChar).Value = string.Format("{0}{1}Executing as {2}\\{3}{1}{4}"
        //                , errorMessage.Message
        //                , Environment.NewLine
        //                , Environment.UserDomainName
        //                , Environment.UserName
        //                , errorMessage.StackTrace);

        //            cmd.ExecuteNonQuery();
        //        }
        //    }
        //}
    }
}
