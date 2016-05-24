require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  # :adam is found in fixtures/users.yml
  def setup
    @user = users(:adam)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  # Run rake test with specific test in a test file like this:
  # TEST=test/integration/users_login_test.rb TESTOPTS="--name test_login_with_valid_information"
  test "login with valid information" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert_redirected_to @user
    # visit targeted page
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
end
