class UsersController < ApplicationController
  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :session_key)
    end
end
