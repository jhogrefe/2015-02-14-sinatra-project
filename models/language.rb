# Public: Language
# A class to get and insert, save and delete new records in the 'languages'
# table of the database.
#
# Attributes:
# @id, @language
#
# Methods:
# #insert, #edit, #delete
class Language
  
  attr_reader :id
  attr_accessor :language
  
  def initialize(options)
    @language = options["language"]
    @id = options["id"]
  end
  
  # Public: #insert
  # Adds the new language to the 'languages' table as a new record and 
  # assigns an id.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # New values as strings for the new language record.
  #
  # State Changes:
  # Inserts values into 'languages' table in the database as a new language
  # record.
  def insert
    DATABASE.execute("INSERT INTO languages (language) 
                      VALUES ('#{@language}')")
    @id = DATABASE.last_insert_row_id
  end
  
  # Public: #edit
  # Updates the language in the 'languages' table.
  #
  # Parameters:
  # language_to_update - String, new name of language record.
  # id_language        - Integer, ID of language to update.
  #
  # Returns:
  # String, new value for language field in updated language record.
  #
  # State Changes:
  # Saves new value in 'languages' table in the database.
  def edit(language_to_update, id_language)
    DATABASE.execute("UPDATE languages SET language = '#{language_to_update}' 
    WHERE id = '#{id_language}'")  
  end

  # Public: #delete
  # Gets the id value and deletes the language record matching the id.
  #
  # Parameters:
  # id_to_delete - Integer, ID of language to delete.
  #
  # Returns:
  # The primary key of the language record being deleted, as a string.
  #
  # State Changes:
  # Removes the language record from the database.   
  def delete(id_to_delete)
    DATABASE.execute("DELETE FROM languages WHERE id = '#{id_to_delete}'")
  end
  
  
  # Public: .all
  # Class method that returns all records in the table
  #
  # Parameters:
  # None.
  #
  # Returns:
  # All table records as objects.
  #
  # State Changes:
  # None.  
  def self.all   
     results = DATABASE.execute("SELECT * FROM languages")   
     results_as_objects = []   
     results.each do |r|
       results_as_objects << self.new(r)
     end  
     results_as_objects
  end
  
end