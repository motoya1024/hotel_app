require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    User.all.each do |user|
      assert_select 'a[href=?]', edit_user_path(user), text: "編集"
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: '削除'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end
  
  test "users search" do
    log_in_as(@admin)
    # All users
    get users_path, params: {search: ""}
    User.all.each do |user|
       assert_select 'a[href=?]', edit_user_path(user), text: "編集"
       unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: '削除'
       end
    end
    
    # User search
    get users_path, params: {search: "a"}
    users = User.search("a")
    users.each do |user|
      assert_select 'a[href=?]', edit_user_path(user), text: "編集"
       unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: '削除'
       end
    end
    
    # User search
    get users_path, params: {search: "aaaaaaaaaaaaaaaaaaaaa"}
    users = User.search("aaaaaaaaaaaaaaaaaaaaa")
    assert users.empty?
  end
  

  
end