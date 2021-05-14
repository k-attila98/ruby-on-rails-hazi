require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_two)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get main page" do
    get root_url
    assert_response :success
    assert_select '.card', 2
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
    assert_select 'p', 4
  end

end
