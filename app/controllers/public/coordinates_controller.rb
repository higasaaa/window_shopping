class Public::CoordinatesController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @coordinates = Coordinate.search(params[:keyword]).page(params[:page]).per(8)
  end

  

  def show
    @coordinate = Coordinate.find(params[:id])
    @comment = Comment.new
  end

end
