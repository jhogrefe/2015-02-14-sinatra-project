###################
# ADMIN HOME PAGE #
###################

get "/y3d8jedu38zm10lt" do
  erb :'language_views/admin', :layout => :'boilerplates/admin_boilerplate'
end


###########################
# HOME PAGE - MAIN SEARCH #
###########################

get "/" do
  erb :'search_views/main_search', :layout => :'boilerplates/boilerplate'
end