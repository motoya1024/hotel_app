require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'tops/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", hotels_path
    assert_select "a[href=?]", login_path
  end

end