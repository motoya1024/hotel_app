require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "ホテル情報検索・投稿サイト"
  end
  
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
end