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



get "/add_language" do
  erb :add_language, :layout => :admin_boilerplate
end

get "/new_language" do
  l1 = Language.new(params)
  l1.insert
  @language = "#{params["language"]}"
  erb :new_language, :layout => :admin_boilerplate
end


get "/edit_language" do
  erb :edit_language, :layout => :admin_boilerplate
end

get "/saved_language" do
  l2 = Language.new(params)
  l2.edit("#{params["language"]}", "#{params["language_id"]}")
  @language = "#{params["language"]}"
  erb :saved_language, :layout => :admin_boilerplate
end


get "/delete_language" do
  erb :delete_language, :layout => :admin_boilerplate
end

get "/deleted_language" do
  l3 = Language.new(params)
  l3.delete(params["language_id"])

  erb :deleted, :layout => :admin_boilerplate
end



get "/add_term" do
  erb :add_term, :layout => :admin_boilerplate
end

get "/new_term" do
  t1 = Term.new(params)
  t1.insert
  @term = "#{params["term"]}"
  erb :new_term, :layout => :admin_boilerplate
end


get "/edit_term" do
  erb :edit_term, :layout => :admin_boilerplate
end

get "/saved_term" do
  t2 = Term.new(params)
  t2.edit("#{params["term"]}", "#{params["term_id"]}")
  @term = "#{params["term"]}"
  erb :saved_term, :layout => :admin_boilerplate
end


get "/delete_term" do
  erb :delete_term, :layout => :admin_boilerplate
end

get "/deleted_term" do
  t3 = Term.new(params)
  t3.delete(params["term_id"])

  erb :deleted, :layout => :admin_boilerplate
end



get "/add_translation" do
  erb :add_translation, :layout => :admin_boilerplate
end

get "/new_translation" do
  tr1 = Translation.new(params)
  tr1.insert
  @translation = "#{params["translation"]}"
  erb :new_translation, :layout => :admin_boilerplate
end


get "/edit_translation" do
  erb :edit_translation, :layout => :admin_boilerplate
end

get "/saved_translation" do
  tr2 = Translation.new(params)
  tr2.edit("#{params["translation"]}", "#{params["translation_id"]}")
  @translation = "#{params["translation"]}"
  erb :saved_translation, :layout => :admin_boilerplate
end


get "/delete_translation" do
  erb :delete_translation, :layout => :admin_boilerplate
end

get "/deleted_translation" do
  tr3 = Translation.new(params)
  tr3.delete(params["translation_id"])
  erb :deleted, :layout => :admin_boilerplate
end