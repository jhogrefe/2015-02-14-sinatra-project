###############################
# ADMIN - MANAGE TRANSLATIONS #
###############################

get "/add_translation" do
  erb :add_translation, :layout => :admin_boilerplate
end

get "/new_translation" do
  tr1 = Translation.new(params)
  tr1.insert
  @translation = "#{params["translation"]}"
  erb :new_translation, :layout => :admin_boilerplate
end


get "/edit_translation" do
  erb :edit_translation, :layout => :admin_boilerplate
end

get "/saved_translation" do
  tr2 = Translation.new(params)
  tr2.edit("#{params["translation"]}", "#{params["translation_id"]}")
  @translation = "#{params["translation"]}"
  erb :saved_translation, :layout => :admin_boilerplate
end


get "/delete_translation" do
  erb :delete_translation, :layout => :admin_boilerplate
end

get "/deleted_translation" do
  tr3 = Translation.new(params)
  tr3.delete(params["translation_id"])
  erb :deleted, :layout => :admin_boilerplate
end


get "/fetch_translations" do
  @translation = Translation.all
  erb :fetch_translations, :layout => :admin_boilerplate
end