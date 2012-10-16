import pyodbc as p
server = 'austest1.core.coremetrics.com'
database = 'CMClient'
userid = 'EAM'
pwd = 'EAM123'

connStr = ( r'DRIVER={SQL Server};SERVER=' +
            server + ';DATABASE=' + database + ';' +
            'UID=' + userid + ';PWD='+pwd+';')        
lst = []
conn = p.connect(connStr)
dbCursor = conn.cursor()
sql = ('SELECT ClientSiteID AS FieldValue FROM dbo.tblClientSiteRecord') 
dbCursor = conn.cursor()
dbCursor.execute(sql)
for row in dbCursor:
    lst.append(row.FieldValue)        
conn.close()
print lst