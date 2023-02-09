class Public::CoordinatesController < ApplicationController
  def index
    @coordinates = Coordinate.all
  end

  def show
  end
  
end
