class Admin::TagsController < ApplicationController
  def index
    @tag = Tag.new 
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path 
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash[:notice] = "タグの更新が成功しました。"
    redirect_to admin_tags_path
  end
  
  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
