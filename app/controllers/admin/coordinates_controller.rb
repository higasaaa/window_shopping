class Admin::CoordinatesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @coordinate = Coordinate.new
  end

  def index
    @coordinates = Coordinate.all
  end

  def edit
    @coordinate = Coordinate.find(params[:id])
  end

  def show
    @coordinate = Coordinate.find(params[:id])
    @comments = @coordinate.comments
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      flash[:notice] = "コーディネートの新規投稿は成功しました。"
      redirect_to admin_coordinates_path #admin/index
    else
      render:new
    end
  end

  def update
    @coordinate = Coordinate.find(params[:id])
    if @coordinate.update(coordinate_params)
      flash[:notice] = "コーディネートの更新は成功しました。"
      redirect_to admin_coordinates_path #admin/index
    else
      render:edit
    end
  end

# 全体のランキング
  def rank
    # byebug
    @all_ranks = Coordinate
      .joins(:tag, :favorites)
      .group(:coordinate_id)
      .order('count(favorites.id) desc')
      .limit(20)
      .select('coordinates.*, tags.tag_name, count(favorites.id) AS cnt')
  end

# monthlyランキング
  def monthly_rank
    @year = params[:year].to_i
    @month = params[:month].to_i

    @all_ranks = Coordinate
      .joins(:tag, :favorites)
      .where(favorites: { created_at: Date.new(@year,@month).beginning_of_month..Date.civil(@year,@month).end_of_month })
      .group(:coordinate_id)
      .order('count(favorites.id) desc')
      .limit(20)
      .select('coordinates.*, tags.tag_name, count(favorites.id) AS cnt')
    render admin_coordinates_rank_path
  end




private

  def coordinate_params
    params.require(:coordinate).permit(:image, :coordinates_description, :total_price, :tag_id, :favorite_id)
  end
end