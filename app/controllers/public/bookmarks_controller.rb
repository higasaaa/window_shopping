class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @coordinates = @customer.coordinates
  end

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    bookmark = @coordinate.bookmarks.new(customer_id: current_customer.id)
    bookmark.save!
  end

  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    bookmark = @coordinate.bookmarks.find_by!(customer_id: current_customer.id)
    bookmark.destroy
  end

end
