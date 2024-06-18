require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @room = rooms(:one)
    sign_in @user
  end

  test "should create message" do
    assert_difference('Message.count', 1) do
      post room_messages_path(@room), params: { message: { body: "Hello, World!" } }
    end
    assert_response :success
    assert_not_nil assigns(:message)
    assert_equal "Hello, World!", assigns(:message).body
    assert_equal @user.id, assigns(:message).user_id
    assert_equal @room.id, assigns(:message).room_id
  end

  

  
end
