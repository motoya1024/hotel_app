class FavoritesController < ApplicationController
  
  before_action :logged_in
  before_action :logged_only_current_user
  
  include HotelsHelper
  
  def new
    @favorite = current_user.favorites.build  
    @site = params[:site]
    @number = params[:number]
    @hotels = get_hotelinfo(@number,@site)
    @sp_hotel = current_user.favorites.where(number: @hotels["ID"]).present? 
  end

  def create
    @favorite = current_user.favorites.build(hotel_params)
    @number = hotel_params["number"]
    @site = hotel_params["site"]
    @hotels = get_hotelinfo(@number,@site)
    if @favorite.save
      flash[:success] = "お気に入りに登録しました。"
      redirect_to user_favorites_url(current_user)
    else
      render 'new'
    end
  end 
 
  def index
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
    @favorite = Favorite.find(params[:id])
  end
  
  def update
    @favorite = Favorite.find(params[:id])
    if @favorite.update_attributes(hotel_params)
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
