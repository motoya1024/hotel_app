require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id: users(:michael).id,post_id: posts(:cat_video).id)
    @other_like = Like.new(user_id: users(:michael).id,post_id: posts(:orange).id)
  end

  test "should be other valid" do
    assert_not @other_like.valid?
  end
  
  test "should be valid" do
    assert @like.valid?
  end
  
  test "should require a follower_id" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "should require a followed_id" do
    @like.post_id = nil
    assert_not @like.valid?
  end
end