class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    # byebug
    if @user && @user.authenticate(params[:password])
      # byebug
      log_in_user(@user.id)
      redirect_to "/users/#{@user.id}/main_page"
    else
      flash[:errors] = ["SrRY. Either you don't have an account or you're a troll."]
      # byebug
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
