class SessionController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/user"
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to '/'
    end
  end
  def delete
    session[:user_id] = nil
    redirect_to '/'
  end
end
