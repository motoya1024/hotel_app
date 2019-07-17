module HotelsHelper

      def get_hotelinfo(hotel_number)
         key = "1023150086339421281";
         feedURL = "https://app.rakuten.co.jp/services/api/Travel/HotelDetailSearch/20131024?applicationId=";
         feedURL = feedURL + key;
         feedURL = feedURL + "&format=xml";
         feedURL = feedURL + "&hotelNo="+ hotel_number.to_s;
         xml = open(feedURL).read
         arr = REXML::Document.new(xml)
      end
      
end