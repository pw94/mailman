require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    message = Message.new
    assert_not message.valid?
    assert_equal [:user, :records, :subject, :body], message.errors.keys
  end

  test "should have at least one record" do
    message = Message.new user: users(:john), subject: 'test subject', body: 'test body'
    assert_not message.valid?
    assert_equal ["Please select at least one record"], message.errors.messages[:records]
  end
end
