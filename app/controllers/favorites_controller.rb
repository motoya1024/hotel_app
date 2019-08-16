class FavoritesController < ApplicationController
  
   include FavoritesHelper
  
   def new
      @user = User.find(current_user.id)
      @favorite = @user.favorites.build  
      @site = params[:site]
      @number = params[:number]
      @hotels = get_hotelinfo(@number,@site)
      @sp_hotel = current_user.favorites.where(number: @hotels["ID"]).present? 
   end

   def create
        @user = User.find(current_user.id)
        @hotel = @user.favorites.build(hotel_params)
        @number = hotel_params["number"]
        @site = hotel_params["site"]
        @arr = get_hotelinfo(@number,@site)
        if @hotel.save
            flash[:success] = "お気に入りに登録しました。"
            redirect_to user_favorites_url(current_user)
        else
            render 'new'
        end
   end 
   
   def index
      @user = User.find(current_user.id)
      @per_pages = ["全表示",5,10,20]
   
      if params[:per_page] == nil || params[:per_page] == "全表示"
        @page = "全表示"
        @hotels = @user.favorites
      else  
        @page = params[:per_page]
        @hotels = @user.favorites.paginate(page: params[:page], per_page: @page)
      end
    end
   
    def destroy
      @hotel = Favorite.find(params[:id])
      if @hotel.destroy
         flash[:success] = "お気に入り情報を削除しました。"
         redirect_to user_favorites_url(current_user)
      else
         render 'edit'
      end
    end
    
    def edit
      @hotel = Favorite.find(params[:id])
    end
    
    def update
      @hotel = Favorite.find(params[:id])
      if @hotel.update_attributes(hotel_params)
        flash[:success] = "お気に入りホテル情報を更新しました。"
        redirect_to user_favorites_url(current_user)
      else
        render "edit"
      end
    end
    
    private
      def hotel_params
        params.require(:favorite).permit(:number,:memo,:name,:site)
      end  
    
end
