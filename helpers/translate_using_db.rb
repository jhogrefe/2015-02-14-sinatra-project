# Creates new translation object and uses searches database translations table 
# to return translation.

require "uri"

module DatabaseTranslation

  def translate_using_db
    s1 = Term.new(params)
    if s1.term == ''
      redirect to("/")
    else
      s1 = Term.where({term: params[:term].rstrip.lstrip.downcase})
      if s1[0] == nil
        redirect to("/custom_search?term=#{URI.escape(params[:term].rstrip.lstrip)}")
      else @term = (params[:term])
      end
      @s2 = Translator.where({term_id: (s1[0].id)})
    end
  end
    
end
