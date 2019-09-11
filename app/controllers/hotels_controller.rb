class HotelsController < ApplicationController
  
  include HotelsHelper

  def show
    @number = params[:number]
    @hotels = get_hotelinfo(@number,@site)
  end

  def index
    @search = params[:search]
    order = params[:key]? params[:key]:4
    if params[:key] == "4"
       sort = "standard"
    elsif params[:key] == "2"
       sort = "+roomCharge"
    else
       sort = "-roomCharge"
    end

    if @search == nil
       place = Geocoder.coordinates("東京都千代田区")
    else
       place = Geocoder.coordinates(@search)
    end
    @counts = { "全表示" => 5000, "5" => 5,  "10" => 10, "20" => 20, "50" => 50, "100" => 100}
    @sorts = { "2" => "平均価格の安い順",  "3" => "平均価格の高い順","4" => "おすすめ順"}
    
    @hotels = []
    begin
      key = "leo157613fc400"
      feedURL = "http://jws.jalan.net/APIAdvance/HotelSearch/V1/?key="
      feedURL = feedURL + key
      conv_lat = ((place[0] * 1.000106961 - place[1] * 0.000017467 - 0.004602017) * 3600000).floor
      conv_lon = ((place[1] * 1.000083049 + place[0] * 0.000046047 - 0.010041046) * 3600000).floor
      feedURL = feedURL + "&x=" + conv_lon.to_s
      feedURL = feedURL + "&y=" + conv_lat.to_s
      feedURL = feedURL + "&range=1.0"
      feedURL = feedURL + "&xml_ptn=2"
      feedURL = feedURL + "&count=100"
      feedURL = feedURL + "&order=" + order.to_s
      xml = open(feedURL).read 
      @arr = REXML::Document.new(xml)
      @arr.elements.each('//Hotel/') do |hotel| 
        @hotel = {
              "No" => hotel.elements["HotelID"].text,
              "Name" => hotel.elements["HotelName"].text,
              "Address" => hotel.elements["HotelAddress"].text,
              "Price" => hotel.elements["SampleRateFrom"].text,
              "InformationURL" => hotel.elements["HotelDetailURL"].text
         }
        @hotels.push(@hotel)
      end
    rescue => e
      flash[:danger] = "場所が検索できませんでした。"
      redirect_to hotels_path
    end
  end
  
  def map
      
      
  end
end
   
