class GamesController < ApplicationController
  def index
    @games = Game.all.includes(:user)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def start
    if !session[:session_key]
      redirect_to root_path
    else
      @current_user = User.find_by_session_key(session[:session_key])
    end
  end

  private

    def game_params
      params.require(:game).permit(:score, :user_id)
    end
end
