class VideoController < ApplicationController
  def video_view
    @video = Video.find(params[:id])
    @comments = @video.comments
  end
  
  def video_view2
		@video1 = Video.find(params[:id1])
		@video2 = Video.find(params[:id2])
		@comments1 = @video1.comments
		@comments2 = @video2.comments
  end
  
  def comment_add
    @video = Video.find(params[:video_id])
    @comment = @video.comments.new(comment_params)
    @comment.save
    redirect_to :action => 'video_view', :id => params[:video_id]
  end
  
  def comment_add1
    @video = Video.find(params[:id1])
    @comment = @video.comments.new(comment_params)
    @comment.save
    redirect_to :action => 'video_view2', :id1 => params[:id1], :id2 => params[:id2]
  end
  
  def comment_add2
    @video = Video.find(params[:id2])
    @comment = @video.comments.new(comment_params)
    @comment.save
    redirect_to :action => 'video_view2', :id1 => params[:id1], :id2 => params[:id2]
  end
  
  private 
  def comment_params
    params.require(:comment).permit(:content, :gender, :age, :score, :video_id)
  end
end
