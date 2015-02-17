require "minitest/autorun"
require "sqlite3"
require 'pry'

DATABASE = SQLite3::Database.new('../database/localization_test.db')


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
  
  # def test_add_location
  #   loc1 = Location.new({"location_name" => "TEST BUILDING"})
  #   x = loc1.insert
  #   assert_equal("TEST BUILDING", loc1.location_name)
  # end
  #
  # def test_add_category
  #   cat1 = Category.new({"manufacturer" => "BANANA"})
  #   x = cat1.insert
  #   assert_equal("BANANA", cat1.manufacturer)
  # end
  #
  # def test_add_category_key
  #   cat2 = Category.new({"manufacturer" => "BANANA"})
  #   x = cat2.insert
  #   assert_equal(1, cat2.id)
  # end
      
end