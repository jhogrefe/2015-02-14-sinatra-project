# Creates new translation object and uses searches database translations table 
# to return translation.
module DatabaseTranslation

  def translate_using_db
    s1 = Term.new(params)
    if s1.term == ''
      redirect to("/")
    else
      s1 = Term.where({term: params[:term].downcase})
      puts "\n\n\n\n\n#{s1.inspect}\n\n\n\n"
      if s1[0] == nil
        redirect to("/custom_search?term=#{params[:term]}")
      else @term = (params[:term])
      end
      @s2 = Translation.where({term_id: (s1[0].id)})
    end
  end
    
end
