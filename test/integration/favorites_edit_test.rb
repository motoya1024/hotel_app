require 'test_helper'

class FavoritesEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @favorite = favorites(:ants)
  end
  
  test "favorite unsuccessful edit" do
    log_in_as(@user)
    get edit_user_favorite_path(@user,@favorite)
    assert_template 'favorites/edit'
    patch user_favorite_path(@user,@favorite), params: { favorite: { memo:  "",number:305158,name:"ホテル"} }

    assert_template 'favorites/edit'
    assert_select "div.alert", "下記の1つのエラーがあります。"
  end  
  
  test "favorite successful edit" do
    log_in_as(@user)
    get edit_user_favorite_path(@user,@favorite)
    assert_template 'favorites/edit'
    memo = "こちらになります"
    patch user_favorite_path(@user,@favorite), params: { favorite: { memo:  memo,number:305158,name:"ホテル"} }
    assert_not flash.empty?
    assert_redirected_to user_favorites_path(@user) 
  end
  

end
