class Admin::CommentsController < ApplicationController



  def destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
    @comment = Comment.find_by(id: params[:id], coordinate_id: params[:coordinate_id])
    @comment.destroy
    redirect_to admin_coordinate_path(@coordinate)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
