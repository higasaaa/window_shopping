class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_customer.favorites.new(coordinate_id: @coordinate.id)
    favorite.save!
    # redirect_to request.referer 非同期通信にするため削除
  end
  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_customer.favorites.find_by!(coordinate_id: @coordinate.id)
    favorite.destroy
    # redirect_to request.referer 非同期通信にするため削除
  end
end
