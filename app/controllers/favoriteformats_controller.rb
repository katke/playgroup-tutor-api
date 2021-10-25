class FavoriteformatsController < ApplicationController
  def create
    favorite = Favoriteformat.new(user_id: current_user.id, format: params[:name])
    if favorite.save
      render json: favorite
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
