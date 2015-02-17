require 'pry'
require 'sinatra'
require 'sqlite3'

DATABASE = SQLite3::Database.new('database/localization.db')


require_relative "database/database_setup"
require_relative "models/term.rb"
require_relative "models/language.rb"
require_relative "models/translation.rb"

