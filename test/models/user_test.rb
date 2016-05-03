require "test_helper"

class UserTest < ActiveSupport::TestCase
  # setup run before each test, run to validate user
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  def test_valid
    assert @user.valid?
  end
end
