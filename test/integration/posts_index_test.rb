require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test "postindex" do
    log_in_as(@user)
    get posts_path
    assert_template 'posts/index'
    posts = Post.all.group_by {|i| i.name}
  end


  test "posts search" do
    log_in_as(@user)
    
    # User search
    get posts_path, params: {search: "D"}
    posts = Post.search("D")
    
    # User search
    get posts_path, params: {search: "aaaaaaaaaaaaaaaaaaaaa"}
    posts = Post.search("aaaaaaaaaaaaaaaaaaaaa")
    assert posts.empty?
  end
end
