############################
# ADMIN - MANAGE LANGUAGES #
############################

get "/add_language" do
  erb :'language_views/add_language', :layout => :'boilerplates/admin_boilerplate'
end

post "/new_language" do
  @lang = Lang.create({lang: params[:lang]})
  erb :'language_views/new_language', :layout => :'boilerplates/admin_boilerplate'
end


get "/edit_language" do
  erb :'language_views/edit_language', :layout => :'boilerplates/admin_boilerplate'
end

post "/saved_language" do
  @lang = Lang.find(params[:lang_id])
  @lang.update({lang: params[:lang]})
  erb :'language_views/saved_language', :layout => :'boilerplates/admin_boilerplate'
end


get "/delete_language" do
  erb :'language_views/delete_language', :layout => :'boilerplates/admin_boilerplate'
end

post "/deleted_language" do
  @lang = Lang.delete(params[:lang_id])
  erb :deleted, :layout => :'boilerplates/admin_boilerplate'
end


get "/fetch_languages" do
  @lang = Lang.all
  erb :'language_views/fetch_languages', :layout => :'boilerplates/admin_boilerplate'
end
