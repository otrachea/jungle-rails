class UsersController < ApplicationController

  def new
    if session[:user_id]
      redirect_to '/'
    end
  end

  def create
    param = user_params
    param[:email] = user_params[:email].downcase.strip
    user = User.new(param)
    if user.save
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :password_confirmation)
  end

end
