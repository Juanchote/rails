class UsersController < ApplicationController
  before_create :create_remember_token
  before_save { self.email = email.downcase }

  # GET /users/new
  def new
    @user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
		  flash[:notice] = "Added User!!!"
		  redirect_to @user
	  else
		  flash[:danger] = "Error!!"
		  render 'new'
	  end
  end

  def show
	  @user = User.find(params[:id])
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

  private

  def user_params
	  params.require(:user).permit(:name, :email, :password,
	                               :password_confirmation)
  end
end
