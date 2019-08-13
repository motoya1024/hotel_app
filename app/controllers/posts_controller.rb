class PostsController < ApplicationController
    
    include PostsHelper
  
    def index
      @per_pages = ["全表示",10,20,30,50,100]
      if params[:per_page] == nil || params[:per_page] == "全表示"
         @page = "全表示"
         @posts = Post.all.group_by {|i| i.name}
      else
         @page = params[:per_page]
         @posts = Post.paginate(page: params[:page], per_page: @page).group_by {|i| i.name}
      end
    end
   
    def new
      @site = params[:site]
      @number = params[:number]
      @post = current_user.posts.build
      @hotel = get_hotelinfo(@number,@site)
    end
    
    def create
      @user = User.find(current_user.id)
      @number = post_params["number"]
      @site = post_params["site"]
      @post = current_user.posts.build(post_params)
      @hotel = get_hotelinfo(@number,@site)
       if @post.save
          flash[:success] = "コメントを登録しました。"
          redirect_to user_favorites_url(current_user)
      else
         render 'new'
      end
    end
    
    private
      def post_params
        params.require(:post).permit(:number,:comment,:name,:site)
      end  
end
