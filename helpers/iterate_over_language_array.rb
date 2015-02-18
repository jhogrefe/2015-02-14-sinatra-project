
# String, gets the language value from the language_id.
module GetLanguage
  
  def get_language(s2_object)
    value = DATABASE.execute("SELECT language FROM languages WHERE 
    id = #{s2_object.language_id}")
    value[0]["language"]
  end
  
end