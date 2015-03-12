class User < ActiveRecord::Base
  include BCrypt

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id]) 
    else
      redirect "/login"
    end
  end

  # users.password_hash in the database is a :string

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
  
  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end
  
  # assign them a random one and mail it to them, asking them to change it
  def forgot_password
    @user = User.find_by_email(params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end
  
end


# password_hash column in table
#
# a = User.new({name: 'test_user'})
# a.password = "fish"

# p1 = Bcrypt::Password.create("password")
# "password" == BCrypt::Password.new(p1)