require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email should be unique" do
    duplicate_user = users(:john).dup
    duplicate_user.password = "123456"
    assert_not duplicate_user.valid?
    assert_equal ["has already been taken"], duplicate_user.errors.messages[:email]
  end
end
