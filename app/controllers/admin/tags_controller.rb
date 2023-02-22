class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
      flash[:notice] = "タグの新規登録が成功しました。"
     else
       @tags = Tag.all
       render:index
    end
  end

  def update
     @tag = Tag.find(params[:id])
      if @tag.update(tag_params)
        flash[:notice] = "タグの更新が成功しました。"
        redirect_to admin_tags_path
      else
        render:edit
      end
  end

  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
