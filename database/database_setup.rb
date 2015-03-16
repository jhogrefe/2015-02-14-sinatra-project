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

unless ActiveRecord::Base.connection.table_exists?(:languages)
  ActiveRecord::Base.connection.create_table :languages do |t|
    t.text :language
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:translations)
  ActiveRecord::Base.connection.create_table :translations do |t|
    t.integer :term_id
    t.integer :language_id
    t.text :translation
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.text :username
    t.text :password_hash
  end 
end
