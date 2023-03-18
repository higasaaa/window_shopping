class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_customer.favorites.new(coordinate_id: @coordinate.id)
    favorite.save!
  end
  
  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_customer.favorites.find_by!(coordinate_id: @coordinate.id)
    favorite.destroy
  end
end
