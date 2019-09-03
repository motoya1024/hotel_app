require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:orange)
    @user = users(:archer)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post user_posts_path(@user), params: { post: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete user_post_path(@post.user_id,@post)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong post" do
    log_in_as(@user)
    assert_no_difference 'Post.count' do
      delete user_post_path(@post.user_id,@post)
    end
   
  end

end