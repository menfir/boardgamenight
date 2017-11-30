require 'bgg_search'
class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /boardgames
  # GET /boardgames.json
  def index
    @boardgames = current_user.boardgames
    if params[:search]
      @bgg = BggSearch.new()
      @bgg.search(params[:search])
      @boardgames = current_user.boardgames.search(params[:search])
    end
  end

  # GET /boardgames/1
  # GET /boardgames/1.json
  def show
  end

  # GET /boardgames/new
  def new
    @boardgame = Boardgame.new()
  end

  # GET /boardgames/1/edit
  def edit
  end

  # POST /boardgames
  # POST /boardgames.json
  def create
    @boardgame =Boardgame.new(boardgame_params)

    respond_to do |format|
      if @boardgame.save
        current_user.boardgames << @boardgame
        format.html { redirect_to @boardgame, notice: 'Boardgame was successfully created.' }
        format.json { render :show, status: :created, location: @boardgame }
      else
        format.html { render :new }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boardgames/1
  # PATCH/PUT /boardgames/1.json
  def update
    respond_to do |format|
      if @boardgame.update(boardgame_params)
        format.html { redirect_to @boardgame, notice: 'Boardgame was successfully updated.' }
        format.json { render :show, status: :ok, location: @boardgame }
      else
        format.html { render :edit }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #search bgg
  def search
    
  end

  # DELETE /boardgames/1
  # DELETE /boardgames/1.json
  def destroy
    @boardgame.destroy
    respond_to do |format|
      format.html { redirect_to boardgames_url, notice: 'Boardgame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boardgame_params
      params.require(:boardgame).permit(:name, :img, :description)
    end
end
