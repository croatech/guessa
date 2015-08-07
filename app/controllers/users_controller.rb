class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def session_destroy
    session.delete(:session_key)
    redirect_to (session[:locale].present? ? root_path(:locale => session[:locale]) : root_path)
  end
end