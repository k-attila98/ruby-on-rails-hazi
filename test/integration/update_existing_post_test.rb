require "test_helper"

class UpdateExistingPostTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_two)
  end

  teardown do
    Rails.cache.clear
  end

  test "should update existing post while logged in" do
    post '/login', params: { email: users(:user_one).email, password: 'komuveles'},
         headers: {'HTTP_REFER': '/'}
    assert_response :redirect
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], users(:user_one).id
    follow_redirect!

    patch post_url(@post), params: { post: {age: 35}}
    assert_response :redirect
    follow_redirect!
    @post.reload
    assert_equal @post.age, 35
  end
end
