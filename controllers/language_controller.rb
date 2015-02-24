###################
# ADMIN HOME PAGE #
###################

get "/admin" do
  erb :'language_views/admin', :layout => :'boilerplates/admin_boilerplate'
end


############################
# ADMIN - MANAGE LANGUAGES #
############################

get "/add_language" do
  erb :'language_views/add_language', :layout => :'boilerplates/admin_boilerplate'
end

get "/new_language" do
  l1 = Language.new(params)
  l1.insert
  @language = "#{params["language"]}"
  erb :'language_views/new_language', :layout => :'boilerplates/admin_boilerplate'
end


get "/edit_language" do
  erb :'language_views/edit_language', :layout => :'boilerplates/admin_boilerplate'
end

get "/saved_language" do
  l2 = Language.new(params)
  l2.edit("#{params["language"]}", "#{params["language_id"]}")
  @language = "#{params["language"]}"
  erb :'language_views/saved_language', :layout => :'boilerplates/admin_boilerplate'
end


get "/delete_language" do
  erb :'language_views/delete_language', :layout => :'boilerplates/admin_boilerplate'
end

get "/deleted_language" do
  l3 = Language.new(params)
  l3.delete(params["language_id"])

  erb :deleted, :layout => :'boilerplates/admin_boilerplate'
end


get "/fetch_languages" do
  @language = Language.all
  erb :'language_views/fetch_languages', :layout => :'boilerplates/admin_boilerplate'
end
