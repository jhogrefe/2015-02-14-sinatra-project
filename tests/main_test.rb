require "minitest/autorun"
require "sqlite3"
require 'pry'
require 'rubygems'
require 'bing_translator'

DATABASE = SQLite3::Database.new('../database/localization_test.db')

require_relative "../helpers/iterate_over_language_array.rb"
require_relative "../database/database_setup"
require_relative "../models/term.rb"
require_relative "../models/language.rb"
require_relative "../models/translation.rb"

class LocalizationTest < Minitest::Test
  
  def setup
    DATABASE.execute("DELETE FROM terms") # terms is the table name
    DATABASE.execute("DELETE FROM languages") # languages is the table name
    DATABASE.execute("DELETE FROM translations") # translations is the table name
  end
  
  def test_add_term
    term1 = Term.new({"term" => "TEST TERM"})
    x = term1.insert
    assert_equal("TEST TERM", term1.term)
  end

  def test_add_language
    lang1 = Language.new({"language" => "FRENCH"})
    x = lang1.insert
    assert_equal("FRENCH", lang1.language)
  end

  def test_add_translation
    trans1 = Translation.new({"term_id" => 1, "language_id" => 1, "translation" => "FRENCH TERM"})
    x = trans1.insert
    assert_equal(1, trans1.id)
  end
      
end