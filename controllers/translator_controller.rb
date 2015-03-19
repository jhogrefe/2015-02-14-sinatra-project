###############################
# ADMIN - MANAGE TRANSLATIONS #
###############################

get "/add_translation" do
  erb :'translation_views/add_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/new_translation" do
  @translator = Translator.create({translator: params[:translator]})
  erb :'translation_views/new_translation', :layout => :'boilerplates/admin_boilerplate'
end


get "/edit_translation" do
  erb :'translation_views/edit_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/saved_translation" do
  @translator = Translator.find(params[:translator_id])
  @translator.update({translator: params[:translator]})
  erb :'translation_views/saved_translation', :layout => :'boilerplates/admin_boilerplate'
end


get "/delete_translation" do
  erb :'translation_views/delete_translation', :layout => :'boilerplates/admin_boilerplate'
end

post "/deleted_translation" do
  @translator = Translator.delete(params[:translator_id])
  erb :deleted, :layout => :'boilerplates/admin_boilerplate'
end


get "/fetch_translations" do
  @translator = Translator.all
  erb :'translation_views/fetch_translations', :layout => :'boilerplates/admin_boilerplate'
end