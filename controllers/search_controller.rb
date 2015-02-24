###########################
# HOME PAGE - MAIN SEARCH #
###########################

get "/" do
  erb :'search_views/main_search', :layout => :'boilerplates/boilerplate'
end


get "/translation" do
  s1 = Term.new(params)
  if s1.term == ''
    redirect to("/")
  else
    s1 = Term.search("#{params["term"].downcase}")
    if s1[0] == nil
      redirect to("/custom_search?term=#{params[:term]}")
      @term = "#{params["term"]}"
    else @term = "#{params["term"]}"
    end
    @s2 = Translation.find(s1[0].id)
  end
  
  erb :'translation_views/translation', :layout => :'boilerplates/boilerplate'
end


#################
# CUSTOM SEARCH #
#################

get "/custom_search" do
  erb :'search_views/custom_search', :layout => :'boilerplates/boilerplate'
end

get "/custom_translation" do
  cs1 = BingTranslator.new('free-software-translation',
  '6njjbzRCq7rG3+CbFZzN+6jEV5ed63U9+2oqkJ9NuKo=', params)
  if params["translate"] == ''
    redirect to("/")
  else
    @es = cs1.translate("#{params["translate"]}", :from => 'en', :to => 'es')
    @fr = cs1.translate("#{params["translate"]}", :from => 'en', :to => 'fr')
    @de = cs1.translate("#{params["translate"]}", :from => 'en', :to => 'de')
    @it = cs1.translate("#{params["translate"]}", :from => 'en', :to => 'it')
    @cs1 = "#{params["translate"]}"
  end
  erb :'translation_views/custom_translation', :layout => :'boilerplates/boilerplate'
end