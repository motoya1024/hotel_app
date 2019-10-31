require 'test_helper'

class HotelsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lana)
    @number = 398395
  end

  test "hotelindex no_login" do
    get hotels_path
    assert_template 'hotels/index'
    assert_select 'a[href=?]', hotel_show_path(number: @number), text: "詳細"
  end
  
  test "hotelindex login" do
    log_in_as(@user)
    get hotels_path
    assert_template 'hotels/index'
    assert_select 'a[href=?]', new_user_favorite_path(@user,number: @number), text: "新規登録"
    assert_select 'a[href=?]', new_user_post_path(@user,number: @number), text: "新規投稿"
  end

end
