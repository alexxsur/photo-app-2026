require "test_helper"

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "guest can access the home page and sign in" do
    get root_path

    assert_response :success
    assert_select "a[href='#{new_user_session_path}']", "Sign in"
  end

  test "guest is redirected from account settings to sign in" do
    get edit_user_registration_path

    assert_redirected_to new_user_session_path
  end

  test "registration form uses Bootstrap form styles" do
    get new_user_registration_path

    assert_response :success
    assert_select "input.form-control[name='user[email]']"
    assert_select "input.btn.btn-primary[type='submit']"
  end

  test "confirmed user can sign in and open account settings" do
    post user_session_path, params: {
      user: { email: users(:one).email, password: "password" }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href='#{edit_user_registration_path}']", "Edit profile"

    get edit_user_registration_path
    assert_response :success
    assert_select "input.form-control[name='user[email]']"
  end
end
