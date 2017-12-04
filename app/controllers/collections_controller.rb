class CollectionsController < ApplicationController

  def create
    @boardgame = Boardgame.find(params[:collection][:boardgame_id])
    current_user.add_to_collection!(@boardgame)
    respond_to do |format|
      format.html { redirect_to @boardgame }
      format.js
    end
  end

  def destroy
    @boardgame = Collection.find(params[:id]).boardgame
    current_user.remove_from_collection!(@boardgame)
    respond_to do |format|
      format.html { redirect_to @boardgame }
      format.js
    end
  end

end
