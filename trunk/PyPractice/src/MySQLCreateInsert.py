import MySQLdb as db
conn = db.connect (host = "auswebdev1.core.coremetrics.com", 
                   user = "root",
                   passwd = "root@core",
                   db = "pligg")
conn.autocommit(True) #Need this line so that data can be instered into tables
cursor = conn.cursor ()
cursor.execute ("DROP TABLE IF EXISTS animal")
cursor.execute ("""
    CREATE TABLE animal
    (
      name     CHAR(40),
      category CHAR(40)
    )
  """)
cursor.execute ("""
    INSERT INTO animal (name, category)
    VALUES
      ('snake', 'reptile'),
      ('frog', 'amphibian'),
      ('tuna', 'fish'),
      ('racoon', 'mammal')
  """)
print "Number of rows inserted: %d" % cursor.rowcount
cursor.close ()
conn.close ()