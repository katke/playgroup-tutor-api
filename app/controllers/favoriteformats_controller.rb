class FavoriteformatsController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def index
    favorites = Favoriteformat.where(user_id: current_user.id)
    render json: favorites
  end

  def create
    favorite = Favoriteformat.new(user_id: params[:user_id], format: params[:name])
    if favorite.save
      render json: favorite
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favoriteformat.find_by(id: params[:id])
    favorite.delete
    render json: favorite
  end
end
