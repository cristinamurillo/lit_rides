class UsersController < ApplicationController
  before_action :require_login
  # before_action -> {authorized?(params[:id])}, except: [:show, :new, :create]
  skip_before_action :require_login, only: [:show, :new, :create, :welcome]
  before_action :set_user, only: [:show, :edit, :update, :account, :main_page, :past_drives, :past_rides, :destroy]
  before_action :authorization, only: [:account, :main_page, :past_drives, :past_rides, :edit, :update, :destroy]

  def welcome

  end

  def account
  end

  def main_page
  end

  def past_drives
  end

  def past_rides
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # if params[:password] == params[:password_confirmation]
      if @user.valid?
        @user.save
        log_in_user(@user.id)
        redirect_to "/users/#{@user.id}/main_page"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
      end
    # else
    #   flash[:errors] = "That don't match, son"
    #   render :new
    # end
  end

  def edit
  end

  def update
    if @user.authenticate(params[:user][:current_password])
      if @user.update(user_params)
        redirect_to "/users/#{@user.id}/main_page"
      else
        render :edit
      end
    else
      flash['notice'] = "sorry"
      render :account
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def authorization
    return head(:forbidden) unless authorized?(@user.id)
  end

  def require_login
    return head(:forbidden) unless session.include?(:user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :age, :car_type, :about_me, :smoking, :pets, :engagement)
  end
end
