class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    bookmark = @coordinate.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    bookmark = @coordinate.bookmarks.find_by!(customer_id: current_customer.id)
    if bookmark.present?  #2度押しのエラーを回避するため
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

end
