require 'test_helper'

class PostsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @post = posts(:ants)
    @hotel = get_hotelinfo(@post.number,@post.site)
  end
  
  test "post unsuccessful edit" do
    log_in_as(@user)
    get edit_user_post_path(@post.user_id,@post)
    assert_template 'posts/edit'
    patch user_post_path(@post.user_id,@post), params: { post: { comment:  "",site:1,number:4924,name:"ホテル"} }
    assert_template 'posts/edit'
    assert_select "div.alert", "下記の1つのエラーがあります。"
  end  
  
  test "post successful edit" do
    log_in_as(@user)
    get edit_user_post_path(@post.user_id,@post)
    assert_template 'posts/edit'
    comment = "こちらになります"
    patch user_post_path(@post.user_id,@post), params: { post: { comment:  comment,site:1,number:4924,name:"ホテル"} }
    assert_not flash.empty?
    assert_redirected_to user_posts_path(@user) 
  end
  

end
