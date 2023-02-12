class Public::CoordinatesController < ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]

  def index
    @coordinates = Coordinate.all
  end

  def show
    @coordinate = Coordinate.find(params[:id])
    @comment = Comment.new
  end


  private

  def coordinate_params
    params.require(:coordinate).permit(:image, :coordinates_description, :total_price, :tag_id)
  end
end
