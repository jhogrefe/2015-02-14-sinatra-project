require 'rubygems'
require 'bundler/setup'

require 'pry'
require 'sinatra'
require 'sqlite3'
require 'bing_translator'

DATABASE = SQLite3::Database.new('database/localization.db')

require_relative "database/database_setup.rb"
require_relative "controllers/index_controllers.rb"
require_relative "controllers/search_controller.rb"
require_relative "helpers/iterate_over_language_array.rb"
require_relative "helpers/translate_using_db.rb"
require_relative "helpers/translate_using_gem.rb"
require_relative "models/modules.rb"
require_relative "controllers/language_controller.rb"
require_relative "controllers/term_controller.rb"
require_relative "controllers/translation_controller.rb"
require_relative "models/term.rb"
require_relative "models/language.rb"
require_relative "models/translation.rb"

helpers GetLanguage, TranslatorService, DatabaseTranslation
