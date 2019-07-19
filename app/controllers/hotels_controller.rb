class HotelsController < ApplicationController
  
    before_action :logged_in, only: [:new,:create]
    before_action :logged_not_current_user, only: [:myhotel,:edit]
    
    include HotelsHelper
    
    def new
      @user = User.find(current_user.id)
      @site = params[:site]
  
      hotel_number = params[:number]
      @hotel = @user.hotels.build
      @arr = get_hotelinfo(hotel_number,@site)
      
    end
  
   def index
      @site = params[:site]
      @search = params[:search]
      if @search == nil
         place = Geocoder.coordinates("東京都千代田区")
      else
         place = Geocoder.coordinates(@search)
      end
    
      begin
        if @site == nil || @site == "1"
          key = "1023150086339421281"
          feedURL = "https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426?applicationId="
          feedURL = feedURL + key
          feedURL = feedURL + "&format=xml"
          feedURL = feedURL + "&latitude="+ place[0].to_s
          feedURL = feedURL + "&longitude="+ place[1].to_s
          feedURL = feedURL + "&searchRadius=1.5"
          feedURL = feedURL + "&allReturnFlag=1"
          feedURL = feedURL + "&datumType=1"
          xml = open(feedURL).read
          @arr = REXML::Document.new(xml)
        elsif @site == "2"
          key = "leo157613fc400"
          feedURL = "http://jws.jalan.net/APIAdvance/HotelSearch/V1/?key="
          feedURL = feedURL + key
          conv_lat = ((place[0] * 1.000106961 - place[1] * 0.000017467 - 0.004602017) * 3600000).floor
          conv_lon = ((place[1] * 1.000083049 + place[0] * 0.000046047 - 0.010041046) * 3600000).floor
          feedURL = feedURL + "&x=" + conv_lon.to_s
          feedURL = feedURL + "&y=" + conv_lat.to_s
          feedURL = feedURL + "&range=1.0"
          xml = open(feedURL).read
          @arr = REXML::Document.new(xml)
         end
      rescue  StandardError => ex
         flash[:danger] = "住所が検索できませんでした。"
         redirect_to hotels_path(site: @site)
      end
    end

    def create
      @user = User.find(current_user.id)
      @hotel = @user.hotels.build(hotel_params)
      if @hotel.save
        flash[:success] = "コメントを登録しました。"
        redirect_to myhotel_url(current_user)
      else
        render 'new'
      end
    end 
    
    def myhotel
        @per_pages = ["全表示",5,10,20]
      if params[:per_page] == nil || params[:per_page] == "全表示"
         @page = "全表示"
         @hotels = @user.hotels
      else
         @page = params[:per_page]
         @hotels = @user.hotels.paginate(page: params[:page], per_page: @page)
      end
      @user = User.find(params[:id])
    end
    
    def destroy
      @hotel = Hotel.find(params[:id])
      if @hotel.destroy
         flash[:success] = "マイホテル情報を削除しました。"
         redirect_to myhotel_url(current_user)
      else
         render 'edit'
      end
    end
    
    def edit
      @hotel = Hotel.find(params[:id])
    end
    
    def update
      @hotel = Hotel.find(params[:id])
      if @hotel.update_attributes(hotel_params)
        flash[:success] = "マイホテル情報を更新しました。"
        redirect_to myhotel_url(current_user)
      else
        render "edit"
      end
    end
    
    private
      def hotel_params
        params.require(:hotel).permit(:hotel_number,:comment,:site)
      end  
    end
