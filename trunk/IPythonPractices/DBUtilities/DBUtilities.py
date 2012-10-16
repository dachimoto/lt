import System.Data
import System.Data.SqlClient
from System.Data import *
class DBUtilities:
	def __init__(self):
		pass
	
	def CDBStr(str,bIsUnicode):
		if len(str) == 0:
			return "''"
		else:
			if bIsUnicode:
				return "N'" + str.Replace("'", "''") + "'"
			else:
				return "'" + str.Replace("'", "''") + "'"
			
	def CDBStr(str):
		return CDBStr(str, true)

	def CDBDate(dtValue, bIsFullDateAndTime):
		if bIsFullDateAndTime:
			return "'" + dtValue.Year.ToString() + "-" + dtValue.Month.ToString() + "-" + dtValue.Day.ToString() + " " + dtValue.Hour.ToString() + ":" + dtValue.Minute.ToString() + "'"
		else:
			return "'" + dtValue.Year.ToString() + "-" + dtValue.Month.ToString() + "-" + dtValue.Day.ToString() + "'"; 

	def CDBDate(dtValue):
		return "'" + dtValue.Year.ToString() + "-" + dtValue.Month.ToString() + "-" + dtValue.Day.ToString() + "'" 

	def GetSQLDataSet(sCnnString, sSQL):
		ds = DataSet("DataSet")		
		cn = SqlConnection(sCnnString)
		cmd = SqlCommand(sSQL, cn)
		cmd.CommandTimeout = 300
		dAdapter = SqlDataAdapter(cmd)
		dAdapter.Fill(ds)
		return ds
	
	def GetSQLScalar(sCnnString, sSQL):
		cn = SqlConnection()
		cmd = SqlCommand()
		cn.ConnectionString = sCnnString
		cn.Open()
		cmd.CommandText = sSQL
		cmd.CommandTimeout = 300
		cmd.Connection = cn
		sRet = cmd.ExecuteScalar()
		cn.Close()
		return strRet
	
	def GetSQLScalar(sCnnString, sStoredProcedureName, cmdParams):
		cn = SqlConnection()
		cmd = SqlCommand()
		cn.ConnectionString = sCnnString
		cn.Open()
		cmd.CommandText = sStoredProcedureName
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandTimeout = 300
		cmd.Connection = cn
		if cmdParams != null:
			for parm in cmdParams:
				cmd.Parameters.Add(parm)
		sRet = cmd.ExecuteScalar()
		cmd.Parameters.Clear()
		cn.Close()
		return sRet

	def ExecSQL(sCnnString, sSQL):
		cn = SqlConnection()
		cmd = SqlCommand()
		cn.ConnectionString = sCnnString
		cn.Open()
		cmd.CommandText = sSQL
		cmd.CommandTimeout = 300
		cmd.Connection = cn
		cmd.ExecuteNonQuery()
		cn.Close()
		
	def ExecSQL(sCnnString, sStoredProcedureName, cmdParams):
		cn = SqlConnection()
		cmd = SqlCommand()
		cn.ConnectionString = sCnnString
		cn.Open()
		cmd.CommandText = sStoredProcedureName
		cmd.CommandType = CommandType.StoredProcedure
		cmd.CommandTimeout = 300
		cmd.Connection = cn
		if cmdParams != null:
			for parm in cmdParams:
				cmd.Parameters.Add(parm)
		cmd.ExecuteNonQuery()
		cmd.Parameters.Clear()
		cn.Close()
		
	def GetExcelDataSet(sExcelFile, sSQL):
		ds = DataSet("DataSet")
		sCnnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + sExcelFile + ";Extended Properties=Excel 8.0;"
		cn = OleDbConnection(sCnnString)
		cmd = OleDbCommand(sSQL, cn)
		cmd.CommandTimeout = 300
		dAdapter = OleDbDataAdapter(cmd)
		dAdapter.Fill(ds)
		return ds

	def GetOracleDataSet(sCnnString, sSQL):
		ds = DataSet("DataSet")
		cn = OleDbConnection(sCnnString)
		cmd = OleDbCommand(sSQL, cn)
		cmd.CommandTimeout = 300
		dAdapter = OleDbDataAdapter(cmd)
		dAdapter.Fill(ds)
		return ds
	
	def ExecOracleSQL(sCnnString, sSQL, cmdType):
		cn = OleDbConnection()
		cmd = OleDbCommand()
		cn.ConnectionString = sCnnString
		cn.Open()
		cmd.CommandType = cmdType
		cmd.CommandText = strSQL
		cmd.CommandTimeout = 300
		cmd.Connection = cn
		cmd.ExecuteNonQuery()
		cn.Close()
		
	def ExecOracleSQL(sCnnString, sSQL):
		ExecOracleSQL(sCnnString, sSQL, CommandType.Text)
		
	def GetODBCDataset(sCnnString, sSQL):
		cn = OdbcConnection(sCnnString)
		dAdapter = OdbcDataAdapter(sSQL, cn)
		ds = DataSet()
		cn.Open()
		dAdapter.Fill(ds)
		return ds
