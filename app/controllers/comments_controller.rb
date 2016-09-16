class CommentsController < ApplicationController
  
  def create
    @photo  = Photo.find(comment_params[:photo_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @photo, notice: "Comment successfully !"
    else
      redirect_to @photo, :flash => { :error => "Comment is error !" }
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :photo_id);
  end
end
