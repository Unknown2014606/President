class AdminController < ApplicationController
  before_action :authenticate
  skip_before_action :authenticate, only: [:login]  
  
  def login
    @usrerr = ''
    @pswerr = ''
    if (defined? params[:login]) && (params[:login][:username] == 'admin') && (defined? params[:login]) && (params[:login][:password] == 'pass')
      session[:user_id] = 'admin'
      redirect_to :action => 'admin'
    else
        if (params[:login][:username] != 'admin')
          @usrerr = 'Input Error.'
        end
        if (params[:login][:password] != 'pass')
          @pswerr = 'Input Error.'
        end
      redirect_to :action => 'index', :controller => 'welcome', :usrerr => @usrerr, :pswerr => @pswerr
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'index', :controller => 'welcome'
  end
  
  def admin
    render 'home'
  end
  def president_new
  end
  def president_add
    #president_params[:supportNo] = 0
    @president = President.new(president_params)

    @president.save
    redirect_to :action => 'president_view', :id => @president[:id]
    #redirect_to @president
  end
  def president_edit
    @president = President.find(params[:id])
  end
  def president_update
    @president = President.find(params[:id])
    if @president.update(president_params)
      redirect_to :action => 'president_view', :id => @president[:id]
    end  
  end
  def president_view
    @president = President.find(params[:id])
  end
  def president_delete
    @president = President.find(params[:id])
    @president.destroy
    redirect_to admin_president_list_path
  end
  def president_list
    @presidents = President.all
  end
  
  private
  def president_params
    params.require(:president).permit(:name, :party, :wiki)
  end
  public
  
  
  def video_new
  end
  def video_add
    @video = Video.new(video_params)

    @video.save
    redirect_to :action => 'video_view', :id => @video[:id]
  end
  private
  def video_params
    params.require(:video).permit(:title, :topic, :president, :embed, :pic)
  end
  public
  def video_edit
    @video = Video.find(params[:id])
    @comments = Comment.where('video_id ==' + params[:id])
  end
  def video_update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to :action => 'video_view', :id => @video[:id]
    end  
  end
  def video_view
    @video = Video.find(params[:id])
  end
  def video_delete
    @video = Video.find(params[:id])
    sql = "delete from comments where video_id = #{params[:id]};"
 		ActiveRecord::Base.connection.update(sql)
    @video.destroy
    redirect_to admin_video_list_path
  end
  def video_list
    @videos = Video.all
  end
  
  def comment_delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_video_edit_path(@comment.video_id)
  end


  private
  def authenticate
    if session[:user_id].nil?
      redirect_to :action => 'index', :controller => 'welcome'
    end
  end
  
  
  
end
