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

  test "registration sends a confirmation email with a local URL" do
    ActionMailer::Base.deliveries.clear

    post user_registration_path, params: {
      user: {
        email: "new-user@example.com",
        password: "password123",
        password_confirmation: "password123"
      }
    }

    assert_equal 1, ActionMailer::Base.deliveries.size
    email = ActionMailer::Base.deliveries.last
    assert_equal [ "new-user@example.com" ], email.to
    assert_includes email.body.encoded, "http://localhost:3000/users/confirmation"
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
