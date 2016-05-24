require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # make sure that errors kick on creating new user, and redirect to users/new
  test "invalid signup information" do
    get signup_path
    # assert_no_difference checks count before and after to be a match
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    # failed template should make users/new render
    assert_template 'users/new'
  end
end