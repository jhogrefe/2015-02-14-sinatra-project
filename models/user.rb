class User < ActiveRecord::Base

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id]) 
    else
      redirect "/login"
    end
  end

end