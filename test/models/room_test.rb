require "test_helper"

class RoomTest < ActiveSupport::TestCase
  def setup
    act_data = actividads(:one).attributes.symbolize_keys
    @actividad = Actividad.new(act_data)
  end

  test "should be valid with attributes" do
    @room = rooms(:one)
    assert @room.valid?
  end


  test "should be valid without name" do
    room_data = rooms(:one).attributes.symbolize_keys
    room = Room.new(room_data)
    room.name = nil
    assert room.valid?
  end

  test "should not be valid without is_private" do
    room_data = rooms(:one).attributes.symbolize_keys
    room = Room.new(room_data)
    room.is_private = nil
    assert_not room.valid?
  end

  test "should not be valid without actividad" do
    room = rooms(:one)
    room.actividad = nil
    assert_not room.valid?
  end

  test "should not save room with duplicate name" do
    existing_room = rooms(:one) 
    new_room = Room.new(name: existing_room.name, actividad_id: existing_room.actividad_id)
    assert_not new_room.save, "Saved the room with duplicate name"
  end

end
