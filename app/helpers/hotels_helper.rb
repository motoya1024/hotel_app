module HotelsHelper

      def get_hotelinfo(hotel_number)
         key = "1023150086339421281";
         feedURL = "https://app.rakuten.co.jp/services/api/Travel/HotelDetailSearch/20131024?applicationId=";
         feedURL = feedURL + key
         feedURL = feedURL + "&format=xml"
         feedURL = feedURL + "&hotelNo="+ hotel_number.to_s
         xml = open(feedURL).read
         arr = REXML::Document.new(xml)
      end
      
      def get_map(address)
         #address = address1 + address2
         place = Geocoder.coordinates(address)
         key = "dj0zaiZpPXdMV2NhazJleFFSTiZzPWNvbnN1bWVyc2VjcmV0Jng9MTI-"
         feedURL = "https://map.yahooapis.jp/map/V1/static?appid="
         feedURL = feedURL + key
         feedURL = feedURL + "&pindefault=" + place[0].to_s + "," + place[1].to_s
         feedURL = feedURL + "&z=16"
         feedURL = feedURL + "&width=600"
         feedURL = feedURL + "&height=600"
      end
      
end