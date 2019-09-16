require 'test_helper'

class LikesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @post = posts(:zone)
    @other_post = posts(:ants)
  end
  
  test "should like post a user with Ajax" do
   
  end

  test "should like delete a user with Ajax" do 
    log_in_as(@user)
    assert_difference '@user.likes.count', -1 do
      delete like_path(id: @other_post.id,user_id:@user.id), xhr: true
    end
  end
  
end
