module FavoritesHelper
  def get_hotelinfo(hotel_number,site)
      if site.to_s == "2"
         key = "leo157613fc400"
         feedURL = "http://jws.jalan.net/APIAdvance/HotelSearch/V1/?key="
         feedURL = feedURL + key
         feedURL = feedURL + "&h_id=" + hotel_number.to_s
         feedURL = feedURL + "&xml_ptn=2"
         xml = open(feedURL).read
         arr = REXML::Document.new(xml)
         hotels = {
          "No" => arr.elements["//Hotel/HotelID"].text,
          "Name" => arr.elements["//Hotel/HotelName"].text,
          "Address" => arr.elements["//Hotel/HotelAddress"].text,
          "Price" => arr.elements["//Hotel/SampleRateFrom"].text,
          "InformationURL" => arr.elements["//Hotel/HotelDetailURL"].text,
          "Access" => arr.elements["//Hotel/AccessInformation"].text,
          "Picture" => arr.elements["//Hotel/PictureURL"].text
        }
      else 
         key = "1023150086339421281"
         feedURL = "https://app.rakuten.co.jp/services/api/Travel/HotelDetailSearch/20131024?applicationId="
         feedURL = feedURL + key
         feedURL = feedURL + "&format=xml"
         feedURL = feedURL + "&hotelNo="+ hotel_number.to_s
         xml = open(feedURL).read
         arr = REXML::Document.new(xml)
         hotels = {
          "No" => arr.elements["//hotels/hotel/hotelBasicInfo/hotelNo"].text,
          "Name" => arr.elements["//hotels/hotel/hotelBasicInfo/hotelName"].text,
          "Address" => arr.elements["//hotels/hotel/hotelBasicInfo/address1"].text << arr.elements["//hotels/hotel/hotelBasicInfo/address2"].text,
          "Price" => arr.elements["//hotels/hotel/hotelBasicInfo/hotelMinCharge"].text,
          "InformationURL" => arr.elements["//hotels/hotel/hotelBasicInfo/hotelInformationUrl"].text,
          "Access" => arr.elements["//hotels/hotel/hotelBasicInfo/access"].text,
          "Picture" => arr.elements["//hotels/hotel/hotelBasicInfo/hotelImageUrl"].text
        }
      end
   end
end
