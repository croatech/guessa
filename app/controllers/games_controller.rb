class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def index
    @games = Game.all.order(score: :desc).includes(:user).limit(6)

    respond_to do |format|
      format.json do
        render :json => @games.to_json(:include => { :user => { :only => :name } })
      end
    end
  end

  def show
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

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Fuck was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
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

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:score, :user_id)
    end
end
