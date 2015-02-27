# Public: Translation
# A class to get and set values in the 'translations' database table.
#
# Attributes:
# id, term_id, language_id, translation.
#
# Methods:
# #insert, #edit, #delete
class Translation
  attr_reader   :id
  attr_accessor :term_id, :language_id, :translation

  def initialize(options)
    @id          = options["id"]
    @term_id     = options["term_id"]
    @language_id = options["language_id"]
    @translation = options["translation"]
  end
  
  # Public: #insert
  # Adds the new translation to the 'translations' table as a new record and 
  # assigns an id.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Inserts values into 'translations' table in the database as a new 
  # translation record.
  def insert    
    DATABASE.execute("INSERT INTO translations (term_id, language_id, translation) 
                      VALUES (#{term_id}, #{language_id}, '#{translation}')")
    @id = DATABASE.last_insert_row_id
  end

  # Public: #edit
  # Updates the values in the 'translations' table.
  #
  # Parameters:
  # translation_to_update - String, new name of translation record.
  # id_translation        - Integer, ID of translation record to update.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Saves new value in 'translations' table in the database.
  def edit(translation_to_update, id_translation)
    DATABASE.execute("UPDATE translations SET translation = '#{translation_to_update}' 
    WHERE id = '#{id_translation}'")        
  end

  # Public: #delete
  # Gets the id value and deletes the translation record matching the id.
  #
  # Parameters:
  # id_to_delete - Integer, ID of language to delete.
  #
  # Returns:
  # Empty Array.
  #
  # State Changes:
  # Removes the translation record from the database.   
  def delete(id_to_delete)
    DATABASE.execute("DELETE FROM translations WHERE id = '#{id_to_delete}'")
  end
  

  # Public: .find
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
  def self.find(term_id)
     results = DATABASE.execute("SELECT * FROM translations WHERE term_id = #{term_id}")
     results_as_objects = []
     results.each do |r|
       results_as_objects << self.new(r)
     end
     results_as_objects
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
     results = DATABASE.execute("SELECT * FROM translations")
     results_as_objects = []
     results.each do |r|
       results_as_objects << self.new(r)
     end
     results_as_objects
  end
  
end