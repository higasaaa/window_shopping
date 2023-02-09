class Admin::CoordinatesController < ApplicationController
  def new
    @coordinate = Coordinate.new
  end

  def index
    @coordinates = Coordinate.all
  end

  def edit
  end

  def create
    # byebug
    @coordinate = Coordinate.new(coordinate_params)
    @coordinate.save
    redirect_to admin_coordinates_index_path #admin/index
  end

  def update
  end


private

  def coordinate_params
    params.require(:coordinate).permit(:image, :coordinates_description, :total_price, :tag_id)
  end
end