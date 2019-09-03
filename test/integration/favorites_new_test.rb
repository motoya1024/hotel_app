require 'test_helper'

class FavoritesNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @site = 1
    @number = 4924
  end
  
  test "favorite unsuccessful new" do
    log_in_as(@user)
    get new_user_favorite_path(@user,site: @site,number: @number)
    assert_template 'favorites/new'
    assert_no_difference 'Favorite.count' do
      post user_favorites_path(@user), params: { favorite: { memo: "",name: "ホテル",number: "4924",site:1} }
    end
  end  
  
  test "favorite successful new" do
    log_in_as(@user)
    get new_user_favorite_path(@user,site: @site,number: @number)
    assert_template 'favorites/new'
    memo = "こちらになります"
    assert_difference 'Favorite.count',1 do
      post user_favorites_path(@user), params: { favorite: { memo: memo,name: "ホテル",number: "4924",site:1} }
    end
    assert_not flash.empty?
    assert_redirected_to user_favorites_path(@user) 
  end
  
end
