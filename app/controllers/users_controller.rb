class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def session_destroy
    session.clear
    redirect_to root_path
  end
end