import MySQLdb as db
conn = db.connect (host = "auswebdev1.core.coremetrics.com", 
                   user = "root",
                   passwd = "root@core",
                   db = "pligg")
cursor = conn.cursor ()
cursor.execute ("SELECT name, category FROM animal")
rows = cursor.fetchall ()
for row in rows:
    print "%s, %s" % (row[0], row[1])
print "Number of rows returned: %d" % cursor.rowcount
cursor.close ()
conn.close ()
