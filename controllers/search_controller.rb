###############
# MAIN SEARCH #
###############

post "/translation" do
  s1 = Term.new(params)
  if s1.term == ''
    redirect to("/")
  else
    s1 = Term.where({term: params[:term].downcase})
    if s1[0] == nil
      redirect to("/custom_search?term=#{params[:term]}")
    else @term = (params[:term])
    end
    @s2 = Translation.where({term_id: (s1[0].id)})
  end
  erb :'translation_views/translation', :layout => :'boilerplates/boilerplate'
end


#################
# CUSTOM SEARCH #
#################

get "/custom_search" do
  erb :'search_views/custom_search', :layout => :'boilerplates/boilerplate'
end

post "/custom_translation" do
  translate_using_gem
  erb :'translation_views/custom_translation', :layout => :'boilerplates/boilerplate'
end