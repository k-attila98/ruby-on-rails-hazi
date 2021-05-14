require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get registration page" do
    get register_url
    assert_response :success
    assert_nil session[:user_id]
    assert_select '.nav-item', 'Bejelentkezés'
    assert_select 'h2', 'Regisztráció'
    assert_select 'form', 1
  end
end
