require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) 
    @room = rooms(:one)
    sign_in @user
  end

  test "should get index" do
    get rooms_path
    assert_response :success
    assert_not_nil assigns(:room)
    assert_not_nil assigns(:rooms)
    assert_not_nil assigns(:users)
    assert_template :index
  end

  test "should show room" do
    get room_path(@room)
    assert_response :success
    assert_not_nil assigns(:single_room)
    assert_not_nil assigns(:room)
    assert_not_nil assigns(:rooms)
    assert_not_nil assigns(:message)
    assert_not_nil assigns(:messages)
    assert_not_nil assigns(:users)
    assert_template :index
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete room_path(@room)
    end
    assert_redirected_to admin_rooms_path
  end

end
