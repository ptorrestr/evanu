require 'test_helper'

class UsersCreateTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @admin = users(:pablo)
    @nutritionist = users(:gloria)
    @normal = users(:kiki)
  end

  test "annonymous user attempt to create a user" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
			       email: "user@invalid",
			       password: "foobar",
			       password_confirmation: "foobar",
			       roles: [roles(:default)] }
    end
    assert_not flash.empty?
  end

  test "invalid creation of nutritionist user" do
    log_in_as(@admin)
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
			       email: "user@invalid",
			       password: "foo",
			       password_confirmation: "bar",
                               roles: [roles(:nutritionist)] }
      assert_template 'users/new'
    end
  end

  test "no permission for creating a nutritionist user" do
    log_in_as(@nutritionist)
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "as",
                               email: "user@invalid.com",
                               password: "foobar",
                               password_confirmation: "foobar",
			       roles: [roles(:nutritionist)] }
    end
    assert_not flash.empty?
  end

#  test "valid signup information with account activation" do
#    get signup_path
#    assert_difference 'User.count', 1 do
#      post users_path, user: { name: "Example User",
#		               email: "user@example.com",
#			       password: "password",
#			       password_confirmation: "password"}
#    end
#    assert_equal 1, ActionMailer::Base.deliveries.size
#    user = assigns(:user)
#    assert_not user.activated?
#    # Try to log in before activation.
#    log_in_as(user)
#    assert_not is_logged_in?
#    # Invalid activation token
#    get edit_account_activation_path("invalid_token")
#    assert_not is_logged_in?
#    # valid token, wrong email
#    get edit_account_activation_path(user.activation_token, email: 'wrong')
#    assert_not is_logged_in?
#    # valid activation token
#    get edit_account_activation_path(user.activation_token, email: user.email)
#    assert user.reload.activated?
#    follow_redirect!
#    assert_template 'users/show'
#    assert is_logged_in?
#  end
end
