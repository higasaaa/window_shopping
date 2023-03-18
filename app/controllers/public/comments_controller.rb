class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.coordinate_id = @coordinate.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      render :create
    else
      render :error
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    @comment = Comment.find_by(id: params[:id], coordinate_id: params[:coordinate_id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
      render :destroy
    else
      render "public/coordinates/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
