require 'test_helper'

class MessagesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:benjamin)
  end

  test "message interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Message.count' do
      post messages_path, message: { content: "" }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This message really ties the room together"
    assert_difference 'Message.count', 1 do
      post messages_path, message: { content: content }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_message = @user.messages.paginate(page: 1).first
    assert_difference 'Message.count', -1 do
      delete message_path(first_message)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end