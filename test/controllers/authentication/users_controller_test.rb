require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create room" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'test@test.com', username: 'test', password: 'test12' } }
    end

    assert_redirected_to reservations_url
  end
end
