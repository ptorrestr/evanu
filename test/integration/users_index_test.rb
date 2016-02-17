require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:pablo)
    @nutritionist = users(:gloria)
    @normal = users(:kiki)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@normal)
    end
  end

  test "index as nutritionist including pagination" do
    log_in_as(@nutritionist)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.where(activated: true).paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      #assert user.nutritionist
      #assert_not user.admin
    end
  end

  test "index as non-admin" do
    log_in_as(@normal)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
