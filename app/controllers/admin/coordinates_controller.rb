class Admin::CoordinatesController < ApplicationController
  def new
    @coordinate = Coordinate.new
  end

  def index
    @coordinates = Coordinate.all
  end

  def edit
    @coordinate = Coordinate.find(params[:id])
  end

  def create
    # byebug
    @coordinate = Coordinate.new(coordinate_params)
    @coordinate.save
    redirect_to admin_coordinates_path #admin/index
  end

  def update
    # byebug
    @coordinate = Coordinate.find(params[:id])
    @coordinate.update(coordinate_params)
      flash[:notice] = "コーディネートの更新は成功しました。"
      redirect_to admin_coordinates_path #admin/index
  end


private

  def coordinate_params
    params.require(:coordinate).permit(:image, :coordinates_description, :total_price, :tag_id)
  end
end