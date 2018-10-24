class UsersController < ApplicationController
  def main_page
    set_user
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
      # byebug
      redirect_to new_user_path
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update
      redirect_to @user
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :car_type, :about_me, :smoking, :pets, :engagement)
  end
end
