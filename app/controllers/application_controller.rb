class ApplicationController < ActionController::Base

  before_action :setup

  private

  def setup
    @logged_in = !!@user

    @message = flash[:message]
    @errors = flash[:errors]
  end

  def log_in_user(user_id)
    session[:user_id] = user_id
  end

  def logged_in_user_id
    session[:user_id]
  end

  def authorized?(user_id)
    logged_in_user_id == user_id
  end
end
