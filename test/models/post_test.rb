require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = @user.posts.build(comment: "aaaaaaaa",name: "ホテル")
  end

  test "should be valid" do
    assert @post.valid?
  end
  
  test "content should be present" do
    @post.comment = "   "
    assert_not @post.valid?
  end

  test "content should be at most 250 characters" do
    @post.comment = "a" * 251
    assert_not @post.valid?
  end
end
