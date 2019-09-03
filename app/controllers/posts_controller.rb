class PostsController < ApplicationController
  before_action :logged_in, only: [:new,:index,:user_index,:create,:destroy,:update]
  before_action :logged_not_current_user, only: [:edit,:update,:destroy,:user_index]
  
  include HotelsHelper

  def index
    @search = params[:search]
    @counts = { "全表示" => 5000, "1" => 1,  "5" => 5,  "10" => 10, "20" => 20, "50" => 50, "100" => 100}
    @posts = Post.search(@search)
  end
 
  def user_index
    @user = User.find(current_user.id)
    @per_pages = ["全表示",5,10,20]
    if params[:per_page] == nil || params[:per_page] == "全表示"
      @page = "全表示"
      @posts = @user.posts
    else  
      @page = params[:per_page]
      @posts = @user.posts.paginate(page: params[:page], per_page: @page)
    end
  end 
  
  def new
    @site = params[:site]
    @number = params[:number]
    @post = current_user.posts.build
    @hotel = get_hotelinfo(@number,@site)
  end
  
  def create
    @number = post_params["number"]
    @site = post_params["site"]
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "コメントを登録しました。"
      redirect_to posts_url(current_user)
    else
      @hotel = get_hotelinfo(@number,@site)
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "コメントを更新しました。"
      redirect_to user_posts_url(current_user)
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "コメントを削除しました。"
      redirect_to user_posts_url(current_user)
    else
      render 'user_index'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:number,:comment,:name,:site)
    end  
end
