require "test_helper"

class DeleteExistingPostTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_two)
  end

  teardown do
    Rails.cache.clear
  end

  test "should delete existing post while logged in" do
    post '/login', params: { email: users(:user_one).email, password: 'komuveles'},
         headers: {'HTTP_REFER': '/'}
    assert_response :redirect
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], users(:user_one).id
    follow_redirect!

    delete post_url(@post)
    assert_response :redirect
    follow_redirect!

    assert_select 'tr', 2 # 2, mert a táblázat header is beleszámít

  end
end
