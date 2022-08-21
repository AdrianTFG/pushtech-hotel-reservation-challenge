require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest

  setup do
    login
    @room = rooms(:room_3)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference("Room.count") do
      post rooms_url, params: { room: { currency: @room.currency, description: @room.description, price: @room.price, room_name: @room.room_name } }
    end

    assert_redirected_to rooms_url
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: { currency: @room.currency, description: @room.description, price: @room.price, room_name: @room.room_name } }
    assert_redirected_to rooms_url
  end

  test "should destroy room" do
    assert_difference("Room.count", -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
    assert_equal flash[:notice], 'Room deleted correctly'
  end

end
