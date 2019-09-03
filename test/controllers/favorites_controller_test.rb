require 'test_helper'


class FavoritesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @favorite = favorites(:orange)
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Favorite.count' do
      post user_favorites_path(@user), params: { favorite: { memo: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Favorite.count' do
      delete user_favorite_path(@user,@favorite)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong favorite" do
    log_in_as(@other_user)
    assert_no_difference 'Favorite.count' do
      delete user_favorite_path(@user,@favorite)
    end
   
  end

  
end
