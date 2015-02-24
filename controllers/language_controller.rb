###################
# ADMIN HOME PAGE #
###################

get "/admin" do
  erb :admin, :layout => :admin_boilerplate 
end


############################
# ADMIN - MANAGE LANGUAGES #
############################

get "/add_language" do
  erb :add_language, :layout => :admin_boilerplate
end

get "/new_language" do
  l1 = Language.new(params)
  l1.insert
  @language = "#{params["language"]}"
  erb :new_language, :layout => :admin_boilerplate
end


get "/edit_language" do
  erb :edit_language, :layout => :admin_boilerplate
end

get "/saved_language" do
  l2 = Language.new(params)
  l2.edit("#{params["language"]}", "#{params["language_id"]}")
  @language = "#{params["language"]}"
  erb :saved_language, :layout => :admin_boilerplate
end


get "/delete_language" do
  erb :delete_language, :layout => :admin_boilerplate
end

get "/deleted_language" do
  l3 = Language.new(params)
  l3.delete(params["language_id"])

  erb :deleted, :layout => :admin_boilerplate
end


get "/fetch_languages" do
  @language = Language.all
  erb :fetch_languages, :layout => :admin_boilerplate
end