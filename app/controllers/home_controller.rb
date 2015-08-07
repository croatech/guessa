class HomeController < ApplicationController
  def index
    if check_exists_key(session[:session_key])
      redirect_to (session[:locale].present? ? start_games_path(:locale => session[:locale]) : start_games_path) 
    else
      session.delete(:session_key)
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

  def switch_language
    session[:locale] = params[:name]
    redirect_to root_path(:locale => session[:locale])
  end
end
