require 'pry'
require 'sinatra'
require 'sqlite3'

DATABASE = SQLite3::Database.new('database/localization.db')


require_relative "database/database_setup.rb"
require_relative "models/term.rb"
require_relative "models/language.rb"
require_relative "models/translation.rb"

get "/" do
  erb :main_search, :layout => :boilerplate
end

get "/translation" do 
  t1 = Translation.new(params)  
  t1.find
  erb :translation, :layout => :boilerplate
end

get "/admin" do
  erb :admin, :layout => :admin_boilerplate 
end


get "/add_translation" do
  erb :add_translation, :layout => :admin_boilerplate
end
