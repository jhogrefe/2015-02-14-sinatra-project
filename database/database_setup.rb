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

unless ActiveRecord::Base.connection.table_exists?(:terms)
  ActiveRecord::Base.connection.create_table :terms do |t|
    t.text :term
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:langs)
  ActiveRecord::Base.connection.create_table :langs do |t|
    t.text :lang
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:translators)
  ActiveRecord::Base.connection.create_table :translators do |t|
    t.integer :term_id
    t.integer :lang_id
    t.text :translator
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.text :username
    t.text :password_hash
  end 
end
