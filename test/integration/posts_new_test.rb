require 'test_helper'

class PostsNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
  end
  
  test "post unsuccessful new" do
    log_in_as(@user)
    get new_user_post_path(@user,number:305158)
    assert_template 'posts/new'
    assert_no_difference 'Post.count' do
      post user_posts_path(@user), params: { post: { comment: "",name: "ホテル",number: 305158} }
    end
  end  
  
  test "post successful new" do
    log_in_as(@user)
    get new_user_post_path(@user,site:1,number:305158)
    assert_template 'posts/new'
    comment = "こちらになります"
    assert_difference 'Post.count',1 do
      post user_posts_path(@user), params: { post: { comment: comment,name: "ホテル",number: 305158} }
    end
    assert_not flash.empty?
    assert_redirected_to user_posts_index_path(@user) 
  end
  

end