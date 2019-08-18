require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "ホテル情報検索・投稿サイト"
    assert_equal full_title("Help"), "Help | ホテル情報検索・投稿サイト"
  end
end