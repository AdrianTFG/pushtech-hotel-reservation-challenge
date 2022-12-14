require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:adrian)
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should login an user by email" do
    post sessions_url, params:  { login: @user.email, password: '123456' }

    assert_redirected_to reservations_url
  end

  test "should login an user by username" do
    post sessions_url, params:  { login: @user.username, password: '123456' }

    assert_redirected_to reservations_url
  end

  test "should logout" do
    login

    delete session_url(@user.id)

    assert_redirected_to new_session_url
    assert_equal flash[:notice], 'Session ended. See you soon!'
  end
end
