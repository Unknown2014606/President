class WelcomeController < ApplicationController
  def index
    @videos = Video.all
    @topics = Video.select(:topic).distinct
    @usrerr = params[:usrerr] if params[:usrerr] != ''
    @pswerr = params[:pswerr] if params[:pswerr] != ''    
    @comments = Comment.group(:video_id).average(:score).sort_by{|v|v[1]}.reverse.take(6)
  end
  
 	def get_options
    options = ""
    @president = Video.where(topic: (params[:topic]))
    @president.each do |s|
      options << "<option value=#{s.id}>#{s.president}</option>"
    end
    render :text => options
  end 
end
