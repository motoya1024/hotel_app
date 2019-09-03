require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test "userpostindex" do
    log_in_as(@user)
    get user_posts_index_path(@user)
    assert_template 'posts/user_index'
    posts = @user.posts.all
    posts.each do |post|
      assert_difference 'Post.count', -1 do
        delete user_post_path(post,user_id:post.user_id)
      end
    end
  end
end
