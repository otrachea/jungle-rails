class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to '/'
    end
  end

  def create
    if user = User.authenticate_with_credientials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
