class AdminController < ApplicationController
  before_action :authenticate
  skip_before_action :authenticate, only: [:admin, :login]
  
  def login
    if (defined? params[:login]) && (params[:login][:username] == 'admin') && (defined? params[:login]) && (params[:login][:password] == 'pass')
      session[:user_id] = 'admin'
      redirect_to :action => 'admin'
    else
        if (params[:login][:username] != 'admin')
          @usrerr = 'Username incorrect.'
        end
        if (params[:login][:password] != 'pass')
          @pswerr = 'Password incorrect.'
        end
      render 'welcome/index'
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'admin'
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
    @video.destroy
    redirect_to admin_video_list_path
  end
  def video_list
    @videos = Video.all
  end

  private
  def authenticate
    #if  || session[:user_id].nil? || session[:user_id] != 'admin'
    if session[:user_id].nil?
      redirect_to :action => 'index', :controller => 'welcome'
    end
  end
  
  
  
end
