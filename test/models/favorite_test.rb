require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @favorite = @user.favorites.build(memo: "aaaaaaaa",name: "ホテル")
  end

  test "should be valid" do
    assert @favorite.valid?
  end
  
  test "content should be present" do
    @favorite.memo = "   "
    assert_not @favorite.valid?
  end

  test "content should be at most 250 characters" do
    @favorite.memo = "a" * 251
    assert_not @favorite.valid?
  end
  
end


