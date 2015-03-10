###############################
# ADMIN - MANAGE TRANSLATIONS #
###############################

get "/add_translation" do
  erb :'translation_views/add_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/new_translation" do
  tr1 = Translation.new(params)
  tr1.insert
  @translation = "#{params["translation"]}"
  erb :'translation_views/new_translation', :layout => :'boilerplates/admin_boilerplate'
end


get "/edit_translation" do
  erb :'translation_views/edit_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/saved_translation" do
  tr2 = Translation.new(params)
  tr2.edit("#{params["translation"]}", "#{params["translation_id"]}")
  @translation = "#{params["translation"]}"
  erb :'translation_views/saved_translation', :layout => :'boilerplates/admin_boilerplate'
end


get "/delete_translation" do
  erb :'translation_views/delete_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/deleted_translation" do
  tr3 = Translation.new(params)
  tr3.delete(params["translation_id"])
  erb :deleted, :layout => :'boilerplates/admin_boilerplate'
end


get "/fetch_translations" do
  @translation = Translation.all
  erb :'translation_views/fetch_translations', :layout => :'boilerplates/admin_boilerplate'
end