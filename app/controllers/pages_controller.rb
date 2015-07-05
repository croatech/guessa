class PagesController < ApplicationController
  def select_game
    if !session[:session_key]
      redirect_to root_path
    end
  end
end
