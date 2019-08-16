class LikesController < ApplicationController
  def create
     @count = params[:count]
     @post = Post.find(params[:id])
     @posts = Post.all.group_by {|i| i.name}
     @like = @post.likes.build(user_id:current_user.id)
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
