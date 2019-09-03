require 'test_helper'

class FavoritesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test "favoriteindex" do
    log_in_as(@user)
    get user_favorites_path(@user)
    assert_template 'favorites/index'
    favorites = @user.favorites.all
    assert_match favorites.first.memo, response.body
    favorites.each do |favorite|
      assert_difference 'Favorite.count', -1 do
        delete user_favorite_path(@user,favorite)
      end
    end
  end

end
