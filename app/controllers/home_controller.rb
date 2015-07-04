class HomeController < ApplicationController
  def index
    if session[:session_key].present?
      redirect_to start_games_path
    end
  end

  def login
    user = User.new(name: params[:name], session_key: SecureRandom.hex)

    if user.save!
      session[:session_key] = user.session_key
      redirect_to start_games_path
    else
      redirect_to :back
    end
  end
end
