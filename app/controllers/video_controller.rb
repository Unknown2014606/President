class VideoController < ApplicationController
  def video_view
    @video = Video.find(params[:id])
    @president = President.where(name: @video.president).take
    @comments = @video.comments
  end
  
  def video_view2
		@video1 = Video.find(params[:id1])
		@video2 = Video.find(params[:id2])
		@president1 = President.where(name: @video1.president).take
		@president2 = President.where(name: @video2.president).take
		@comments1 = @video1.comments
		@comments2 = @video2.comments
  end
  
  def comment_add
    @video = Video.find(params[:video_id])
    @comment = @video.comments.new(comment_params)
    if @comment.score.nil?
    	@comment.score = 50
    end
    @comment.save
    redirect_to :action => 'video_view', :id => params[:video_id]
  end
  
  def comment_add1
    @video = Video.find(params[:id1])
    @comment = @video.comments.new(comment_params)
   	if @comment.score.nil?
    	@comment.score = 50
    end
    @comment.save
    redirect_to :action => 'video_view2', :id1 => params[:id1], :id2 => params[:id2]
  end
  
  def comment_add2
    @video = Video.find(params[:id2])
    @comment = @video.comments.new(comment_params2)
    if @comment.score.nil?
    	@comment.score = 50
    end
    @comment.save
    redirect_to :action => 'video_view2', :id1 => params[:id1], :id2 => params[:id2]
  end
  
  private 
  def comment_params
    params.require(:comment).permit(:content, :gender, :age, :score, :video_id)
  end
  def comment_params2
    params.require(:comment2).permit(:content, :gender, :age, :score, :video_id)
  end
end
