require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login page" do
    get login_url
    assert_response :success
    assert_nil session[:user_id]
    assert_select '.nav-item', 'Bejelentkezés'
    assert_select 'h1', 'Kérlek jelentkezz be'
    assert_select 'form', 1
  end

  test "should get index, while logged" do
    get login_url
    assert_response :success
    assert_nil session[:user_id]
    assert_select '.nav-item', 'Bejelentkezés'
    assert_select 'h1', 'Kérlek jelentkezz be'
    assert_select 'form', 1

    post '/login', params: { email: users(:user_one).email, password: 'komuveles'},
         headers: {'HTTP_REFER': '/'}
    assert_response :redirect
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], users(:user_one).id
    follow_redirect!
    assert_select 'li', 4 # navbarban több elem is van -> be van jelentkezve
    assert_select 'h1', 'Főoldal'

  end

  test "should get index, after logout" do
    delete logout_url
    assert_response :redirect
    assert_nil session[:user_id]
    follow_redirect!
    assert_select '.nav-item', 'Bejelentkezés'
    assert_select 'h1', 'Főoldal'
  end
end