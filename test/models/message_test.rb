require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    user_data = users(:one).attributes.symbolize_keys
    @user = User.new(user_data)
    room_data = rooms(:one).attributes.symbolize_keys
    @room = Room.new(room_data)
  end


  test "should be valid with attributes" do
    message_data = messages(:one).attributes.symbolize_keys
    message = Message.new(message_data)
    assert message.valid?
  end

  test "should not be valid without user" do
    message_data = messages(:one).attributes.symbolize_keys
    message = Message.new(message_data)
    message.user = nil
    assert_not message.valid?
  end

  test "should not be valid without room" do
    message_data = messages(:one).attributes.symbolize_keys
    message = Message.new(message_data)
    message.room = nil
    assert_not message.valid?
  end

  test "should be valid without body" do
    message_data = messages(:one).attributes.symbolize_keys
    message = Message.new(message_data)
    message.body = nil 
    assert message.valid?
  end

end
