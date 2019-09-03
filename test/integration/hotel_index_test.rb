require 'test_helper'

class HotelsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lana)
    @site = 1
    @number = 4924
  end

  test "hotelindex no_login" do
    get hotels_path
    assert_template 'hotels/index'
    assert_select 'a[href=?]', hotel_show_path(site: @site,number: @number), text: "詳細"
  end
  
  test "hotelindex login" do
    log_in_as(@user)
    get hotels_path
    assert_template 'hotels/index'
    assert_select 'a[href=?]', new_user_favorite_path(@user,site: @site,number: @number), text: "登録"
    assert_select 'a[href=?]', new_user_post_path(@user,site: @site,number: @number), text: "投稿"
  end

end
