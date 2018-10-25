class UsersController < ApplicationController
  before_action :require_login
  # before_action -> {authorized?(params[:id])}, except: [:show, :new, :create]
  skip_before_action :require_login, only: [:show, :new, :create, :welcome]

  def welcome
  end

  def account
    set_user
    authorization
  end

  def main_page
    set_user
    authorization
  end

  def past_drives
    set_user
    authorization
  end

  def past_rides
    set_user
    authorization
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    set_user
    authorization
  end

  def update
    set_user
    authorization
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}/main_page"
    else
      set_user
      render :edit
    end
  end
  #
  # def destroy
  #   set_user
  #   @user.destroy
  # end

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
