class Public::HomesController < ApplicationController
  def top
    @coordinates = Coordinate.order('id DESC').limit(4)
  end

  def about
  end

end

