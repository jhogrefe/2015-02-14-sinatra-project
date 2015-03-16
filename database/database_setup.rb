configure :development do
  set :database, {adapter: "sqlite3", database: "database/localization.db"}
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
)
end

DATABASE = SQLite3::Database.new('database/localization.db')


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
                  translation TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS users 
                  (id INTEGER PRIMARY KEY,
                   username TEXT,
                   password_hash TEXT)")
                                                       
set :database, {adapter: "sqlite3", database: "database/localization.db"}
