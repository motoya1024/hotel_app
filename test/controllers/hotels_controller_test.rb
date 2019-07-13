require 'test_helper'

class HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hotels_new_url
    assert_response :success
  end

end
