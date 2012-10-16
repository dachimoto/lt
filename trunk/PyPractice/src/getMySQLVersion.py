import MySQLdb as db
conn = db.connect (host = "auswebdev1.core.coremetrics.com", 
                   user = "root",
                   passwd = "root@core",
                   db = "pligg")
cursor = conn.cursor()
cursor.execute ("SELECT VERSION()")
row = cursor.fetchone ()
print "server version:", row[0]
cursor.close ()
conn.close ()
