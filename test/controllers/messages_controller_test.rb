require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  def setup
    @message = messages(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Message.count' do
      post :create, message: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Message.count' do
      delete :destroy, id: @message
    end
    assert_redirected_to login_url
  end

   test "should redirect destroy for wrong message" do
    log_in_as(users(:benjamin))
    message = messages(:ants)
    assert_no_difference 'Message.count' do
      delete :destroy, id: message
    end
    assert_redirected_to root_url
  end
end