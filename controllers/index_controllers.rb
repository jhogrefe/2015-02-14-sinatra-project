###################
# ADMIN HOME PAGE #
###################

get "/y3d8jedu38zm10lt" do
  if session[:user_id]
    @current_user = User.find(session[:user_id]) 
  else
    redirect "/login"
  end
  erb :'language_views/admin', :layout => :'boilerplates/admin_boilerplate'
end


######################
# LOGIN PAGE - ADMIN #
######################

get "/login" do
  erb :'user_views/login', :layout => :'boilerplates/boilerplate'
end

get "/y3d8jedu38zm10lt-ck" do
  if results = User.where({username: params[:username]})
    session[:user_id] = results[0].id
    redirect to("/y3d8jedu38zm10lt")
  else
    redirect to("/login")
  end

  erb :'language_views/admin', :layout => :'boilerplates/admin_boilerplate' 
end


#######################
# LOGOUT PAGE - ADMIN #
#######################

get "/logout" do
    session.clear
    redirect to("/login")
    
  erb :'user_views/login', :layout => :'boilerplates/boilerplate'
end


###########################
# HOME PAGE - MAIN SEARCH #
###########################

get "/" do
  erb :'search_views/main_search', :layout => :'boilerplates/boilerplate'
end