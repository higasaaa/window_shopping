class Admin::CoordinatesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @coordinate = Coordinate.new
  end

  def index
    @coordinates = Coordinate.all.page(params[:page]).per(5)
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
      flash[:notice] = "コーディネートの新規投稿は成功しました"
      redirect_to admin_coordinates_path
    else
      render:new
    end
  end

  def update
    @coordinate = Coordinate.find(params[:id])
    if @coordinate.update(coordinate_params)
      flash[:notice] = "コーディネートの更新は成功しました"
      redirect_to admin_coordinates_path
    else
      render:edit
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.destroy
    flash[:notice] = "コーディネートを削除しました"
    redirect_to admin_coordinates_path
  end

# 全体のランキング
  def rank
    @all_ranks = Coordinate
      .joins(:tag, :favorites)
      .group(:coordinate_id)
      .order('count(favorites.id) desc')
      .limit(20)
      .select('coordinates.*, tags.tag_name, count(favorites.id) AS cnt')


    last_rank = 0
    last_fav_count = Float::INFINITY

    @all_ranks = @all_ranks.map do |c|
      if c.favorites.count < last_fav_count
        last_rank += 1
        last_fav_count = c.favorites.count
      end
      c.rank = last_rank
      c
    end
  end

# URLに西暦+月を入力後
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


    last_rank = 0
    last_fav_count = Float::INFINITY

    @all_ranks = @all_ranks.map do |c|
      if c.favorites.count < last_fav_count
        last_rank += 1
        last_fav_count = c.favorites.count
      end
      c.rank = last_rank
      c
    end

    render admin_coordinates_rank_path
  end


private

  def coordinate_params
    params.require(:coordinate).permit(:image, :coordinates_description, :total_price, :tag_id, :favorite_id)
  end
end