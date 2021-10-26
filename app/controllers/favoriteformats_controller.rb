class FavoriteformatsController < ApplicationController
  def create
    pp params
    favorite = Favoriteformat.new(user_id: current_user.id, format: params[:name])
    if favorite.save
      render json: favorite
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    favorites = Favoriteformat.where(user_id: current_user.id)
    render json: favorites
  end

  def create
    favorite = Favoriteformat.new(user_id: current_user.id, format: params[:name])
    if favorite.save
      render json: favorite
    else
      render json: { errors: favorite.errors }
    end
  end

  def destroy
    favorite = Favoriteformat.find_by(id: params[:id])
    favorite.delete
    render json: favorite
  end
end
