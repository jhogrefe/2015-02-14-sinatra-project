########################
# ADMIN - MANAGE TERMS #
########################

get "/add_term" do
  erb :'term_views/add_term', :layout => :'boilerplates/admin_boilerplate'
end

post "/new_term" do
  @term = Term.create({term: params[:term]})
  erb :'term_views/new_term', :layout => :'boilerplates/admin_boilerplate'
end


get "/edit_term" do
  erb :'term_views/edit_term', :layout => :'boilerplates/admin_boilerplate'
end

post "/saved_term" do
  t2 = Term.new(params)
  t2.edit("#{params["term"]}", "#{params["term_id"]}")
  @term = "#{params["term"]}"
  erb :'term_views/saved_term', :layout => :'boilerplates/admin_boilerplate'
end


get "/delete_term" do
  erb :'term_views/delete_term', :layout => :'boilerplates/admin_boilerplate'
end

post "/deleted_term" do
  @term = Term.delete(params[:term_id])
  erb :deleted, :layout => :'boilerplates/admin_boilerplate'
end


get "/fetch_terms" do
  @term = Term.all
  erb :'term_views/fetch_terms', :layout => :'boilerplates/admin_boilerplate'
end