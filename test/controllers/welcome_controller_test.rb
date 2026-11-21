require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path

    assert_response :success
    assert_select ".welcome-hero h1", "Make room for what matters."
    assert_select ".plan-card h3", "Premium"
    assert_select ".plan-card h3", "Amaze"
    assert_select ".plan-card .plan-price span", "$10"
    assert_select ".plan-card .plan-price span", "$20"
    assert_select "a[href='#{new_user_registration_path}']", text: "Get started", count: 1
    assert_select "a[href='#{new_user_registration_path}']", text: "Sign up", count: 2
  end
end
