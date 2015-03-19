###############
# MAIN SEARCH #
###############

post "/translation" do
  translate_using_db
  binding.remote_pry
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