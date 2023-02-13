class Public::CommentsController < ApplicationController

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    comment = current_customer.comments.new(comment_params)
    comment.coordinate_id = @coordinate.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id]) #idが存在しないことが想定される場合→find_byメソッドを使用
    @comment = Comment.find_by(id: params[:id], coordinate_id: params[:coordinate_id])
    @comment.destroy
    redirect_to request.referer
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
  #showいる？Viewファイル未
end
