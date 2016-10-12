class CommentsController < ApplicationController
  
  def create
    @photo  = Photo.find(comment_params[:photo_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @photo, notice: "Comment successfully !"
    else
      redirect_to @photo, :flash => { :error => "Comment is error !" }
    end
  end
  
  def active
    @comment = Comment.find(params[:id])
    @comment.status = 1;
    if @comment.save
      redirect_to edit_photo_path(params[:photo_id]), notice: "Comment active successfully !"
    else
      redirect_to edit_photo_path(params[:photo_id]), :flash => { :error => "Comment active error !" }
    end 
  end
  
  def deactive
    @comment = Comment.find(params[:id])
    @comment.status = 0;
    if @comment.save
      redirect_to edit_photo_path(params[:photo_id]), notice: "Comment deactive successfully !"
    else
      redirect_to edit_photo_path(params[:photo_id]), :flash => { :error => "Comment active error !" }
    end 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :photo_id);
  end
end
