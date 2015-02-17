DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS terms 
                  (id INTEGER PRIMARY KEY,
                   term TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS languages 
                  (id INTEGER PRIMARY KEY,
                   language TEXT)")
                   
DATABASE.execute("CREATE TABLE IF NOT EXISTS translations 
                  (id INTEGER PRIMARY KEY,
                  term_id INTEGER,
                  language_id INTEGER,
                  translation TEXT")