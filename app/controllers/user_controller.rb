class UserController < ApplicationController
  def create
    @user = User.create(user_params)
    if !@user.valid?
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    else
      session[:user_id] = @user.id
      redirect_to '/user'
    end
  end
  def main
    @groups = Group.all
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
