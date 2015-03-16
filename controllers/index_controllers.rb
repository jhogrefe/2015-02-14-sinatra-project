###################
# ADMIN HOME PAGE #
###################

before '/y3d8jedu38zm10lt' do
  redirect to ("/login") unless session[:user_id]
end

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

post "/verify" do
  user = User.find_by(username: params[:username])    
  if BCrypt::Password.new(user.password) == params["password"]
    session[:user_id] = user.id
    redirect to("/y3d8jedu38zm10lt")
  else
    redirect to("/login")
  end

  erb :'language_views/admin', :layout => :'boilerplates/admin_boilerplate' 
end

post "/new_user" do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save!
    redirect to ("/y3d8jedu38zm10lt")
    erb 'language_views/admin'
  else 
    redirect to ("/login")
  end
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