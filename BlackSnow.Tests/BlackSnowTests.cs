using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;

namespace BlackSnow.Tests
{
    [TestClass]
    public class BlackSnowTests
    {


        [TestMethod]
        public void TestGetFileFormatHeader()
        {

            var flatFileFormat = Mapping.GetFileFormatHeader("CrmAdo", 1);
            Console.Write(flatFileFormat);
        }


        [TestMethod]
        public void TestGetFileFormatColumns()
        {
            var flatFileFormat = Mapping.GetFileFormatColumns("CrmAdo", 2);
            Assert.AreEqual("<Column Name = \"", flatFileFormat.Substring(0,16));
            Console.Write(flatFileFormat);
        }

        [TestMethod]
        public void TestGetFlatFiles()
        {
            var flatFileFormat = Mapping.GetFlatFiles("CrmAdo");
            foreach (var formatId in flatFileFormat)
            {
                Console.Write(formatId + Environment.NewLine);
            }
        }

        [TestMethod]
        public void TestGetMulticastPaths()
        {
            var paths = Mapping.GetMulticastPaths("CrmAdo", 1);
            foreach (DataRow row in paths.Rows)
            {
                Console.Write(row["MulticastPath"] + Environment.NewLine);
            }
            Assert.AreEqual(paths.Rows.Count, 5);
        }

        [TestMethod]
        public void TestGetUnpivotPaths()
        {
            var paths = Mapping.GetUnpivotEntities("CrmAdo", 1);
            foreach (DataRow row in paths.Rows)
            {
                Console.Write(row["TargetTable"] + Environment.NewLine);
            }
            Assert.AreEqual(paths.Rows.Count, 2);
        }

        [TestMethod]
        public void TestGetUnpivotComponent()
        {
            var unpivot = Mapping.GetUnpivotComponent("CrmAdo", 1, "Phone");
            Console.Write(unpivot);
        }

        [TestMethod]
        public void TestGetUnpivotComponentFindsNothing()
        {
            var unpivot = Mapping.GetUnpivotComponent("CrmAdo", 1, "TableNotExisting");

            Console.Write(unpivot);
        }
        [TestMethod]
        public void TestGetUnpivotTargetField()
        {
            var target = Mapping.GetUnpivotOutputField("CrmAdo", 1, "Phone");

            Console.Write(target);
            Assert.AreEqual(target, "PhoneNumber");
        }

        [TestMethod]
        public void TestGetConnectionName()
        {
            Console.Write(Mapping.GetConnectionName("CrmAdo", 1));
            Assert.AreEqual(Mapping.GetConnectionName("CrmAdo", 1), "OnlineStore");
        }

        //[TestMethod]
        //public void TestGetAdoConnectionString()
        //{
        //    var flatFileFormat = Mapping.GetConnectionString("CrmAdo", 1);
        //    Console.Write(flatFileFormat);
        //}

        //[TestMethod]
        //public void TestGetOleDbConnectionString()
        //{
        //    var flatFileFormat = Mapping.GetConnectionString("CrmAdo", 1);
        //    Console.Write(flatFileFormat);
        //}

        //[TestMethod]
        //public void TestGetDataTable()
        //{
        //}


        [TestMethod]
        public void TestWriteError()
        {
        }




        [TestMethod]
        public void TestTemplate()
        {
        }






    }
}
