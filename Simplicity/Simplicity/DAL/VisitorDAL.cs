using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Simplicity.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace Simplicity.DAL
{
    public class VisitorDAL
    {
        Database objDB;

        static string connectionString;
        /*
         * Instantiate connection
         */
        public VisitorDAL()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        }

        /*
         * To get visitor list from database records
         */
        public DataSet GetVisitorDetails()
        {
            objDB = new SqlDatabase(connectionString);
            using (DbCommand objcmd = objDB.GetStoredProcCommand("SP_VisitorList_Select"))
            {
                try
                {
                    return objDB.ExecuteDataSet(objcmd);
                }
                catch (Exception ex)
                {
                    throw ex;
                    return null;
                }
            }

        }

        /*
         * To insert new visitor into database records
         */
        public int InsertVisitorRecord(VisitorDetails visitorDetails)
        {
            int result = 0;
            objDB = new SqlDatabase(connectionString);
            using (DbCommand objCMD = objDB.GetStoredProcCommand("SP_VistorInfo_INSERT"))
            {
                objDB.AddInParameter(objCMD, "@ipAddress", DbType.String, visitorDetails.ipAddress);
                objDB.AddInParameter(objCMD, "@dateTime", DbType.DateTime, visitorDetails.dateTime);

                try
                {
                    result = objDB.ExecuteNonQuery(objCMD);
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return result;

        }
    }
}