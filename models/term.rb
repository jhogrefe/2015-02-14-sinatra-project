# Public: Term
# A class to get and insert, save and delete new records in the 'terms'
# table of the database.
#
# Attributes:
# @id, @term
#
# Methods:
# #insert, #edit, #delete
class Term < ActiveRecord::Base
  # has_many :languages, :translations
  # extend HelperMethods
  #
  # attr_reader :id
  # attr_accessor :term
  #
  # def initialize(options)
  #   @term = options["term"]
  #   @id = options["id"]
  # end
  #
  # # Public: #insert
  # # Adds the new English term to the 'terms' table as a new record and
  # # assigns an id.
  # #
  # # Parameters:
  # # None.
  # #
  # # Returns:
  # # Empty Array.
  # #
  # # State Changes:
  # # Inserts values into 'terms' table in the database as a new term
  # # record.
  # def insert
  #   DATABASE.execute("INSERT INTO terms (term)
  #                     VALUES ('#{@term}')")
  #   @id = DATABASE.last_insert_row_id
  # end
  #
  # # Public: #edit
  # # Updates the English term in the 'terms' table.
  # #
  # # Parameters:
  # # term_to_update - String, new name of term record.
  # # id_term        - Integer, ID of term to update.
  # #
  # # Returns:
  # # Empty Array.
  # #
  # # State Changes:
  # # Saves new value in 'terms' table in the database.
  # def edit(term_to_update, id_term)
  #   DATABASE.execute("UPDATE terms SET term = '#{term_to_update}'
  #   WHERE id = '#{id_term}'")
  # end
  #
  # # Public: #delete
  # # Gets the id value and deletes the term record matching the id.
  # #
  # # Parameters:
  # # id_to_delete - Integer, ID of term to delete.
  # #
  # # Returns:
  # # Empty Array.
  # #
  # # State Changes:
  # # Removes the term record from the database.
  # def delete(id_to_delete)
  #   DATABASE.execute("DELETE FROM terms WHERE id = '#{id_to_delete}'")
  # end
  #
  # # Public: .search
  # # Class method that returns all records in the table
  # #
  # # Parameters:
  # # None.
  # #
  # # Returns:
  # # All table records as objects.
  # #
  # # State Changes:
  # # None.
  # def self.search(term_arg)
  #    results = DATABASE.execute("SELECT * FROM terms WHERE term = '#{term_arg}'")
  #    hashes_into_objects(results)
  # end
  #
  # # Public: .all
  # # Class method that returns all records in the table
  # #
  # # Parameters:
  # # None.
  # #
  # # Returns:
  # # All table records as objects.
  # #
  # # State Changes:
  # # None.
  # def self.all
  #    results = DATABASE.execute("SELECT * FROM terms")
  #    hashes_into_objects(results)
  # end

end