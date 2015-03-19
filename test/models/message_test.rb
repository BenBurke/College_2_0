require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @user = users(:benjamin)
    # This code is not idiomatically correct.
	@message = @user.messages.build(content: "Lorem Ipsum")
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "user id should be present" do
    @message.user_id = nil
    assert_not @message.valid?
  end

  test "content should be present " do
    @message.content = "   "
    assert_not @message.valid?
  end

  test "order should be most recent first" do
    assert_equal Message.first, messages(:most_recent)
  end
end