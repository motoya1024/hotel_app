class LikesController < ApplicationController
  before_action :logged_in, only: [:create, :destroy]
  before_action :logged_only_current_user, only: [:create, :destroy]
  
  def create
    @count = params[:count]
    @post = Post.find(params[:id])
    @posts = Post.all.group_by {|i| i.name}
    @like = @post.likes.build(user_id: current_user.id)
    @like.save  
  end
  
  def destroy
    @post = Post.find(params[:id])
    @count = params[:count]
    @posts = Post.all.group_by {|i| i.name}
    @like = @post.likes.find_by(user_id: current_user.id)
    @like.destroy
  end
end
