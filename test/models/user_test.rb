require "test_helper"

class UserTest < ActiveSupport::TestCase
  # setup run before each test, run to validate user
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  def test_valid
    assert @user.valid?
  end

  # validity of name and email contingent on not being blank
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      # inspect would give literal address that causes failure
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
