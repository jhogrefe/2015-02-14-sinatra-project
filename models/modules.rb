module HelperMethods

  def hashes_into_objects(hash_array)
    results_as_objects = []   
    hash_array.each do |r|
      results_as_objects << self.new(r)
    end  
    results_as_objects
  end

end