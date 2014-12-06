class WelcomeController < ApplicationController
  def index
    @videos = Video.all
    @topics = Video.select(:topic).distinct
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
