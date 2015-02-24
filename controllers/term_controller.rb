########################
# ADMIN - MANAGE TERMS #
########################

get "/add_term" do
  erb :add_term, :layout => :admin_boilerplate
end

get "/new_term" do
  t1 = Term.new(params)
  t1.insert
  @term = "#{params["term"]}"
  erb :new_term, :layout => :admin_boilerplate
end


get "/edit_term" do
  erb :edit_term, :layout => :admin_boilerplate
end

get "/saved_term" do
  t2 = Term.new(params)
  t2.edit("#{params["term"]}", "#{params["term_id"]}")
  @term = "#{params["term"]}"
  erb :saved_term, :layout => :admin_boilerplate
end


get "/delete_term" do
  erb :delete_term, :layout => :admin_boilerplate
end

get "/deleted_term" do
  t3 = Term.new(params)
  t3.delete(params["term_id"])

  erb :deleted, :layout => :admin_boilerplate
end


get "/fetch_terms" do
  @term = Term.all
  erb :fetch_terms, :layout => :admin_boilerplate
end