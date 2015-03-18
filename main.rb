require 'rubygems'
require 'bundler/setup'

require 'pry'
require 'sinatra'
require 'sinatra/activerecord'
configure :development do
  require 'sqlite3'
end
require 'bing_translator'
require 'bcrypt'

require_relative "database/database_setup.rb"
require_relative "controllers/index_controllers.rb"
require_relative "controllers/search_controller.rb"
require_relative "helpers/translate_using_db.rb"
require_relative "helpers/translate_using_gem.rb"
require_relative "controllers/lang_controller.rb"
require_relative "controllers/term_controller.rb"
require_relative "controllers/translation_controller.rb"
require_relative "models/user.rb"
require_relative "models/term.rb"
require_relative "models/lang.rb"
require_relative "models/translation.rb"

enable :sessions

helpers TranslatorService, DatabaseTranslation
