require "test_helper"

class CreateNewPostTest < ActionDispatch::IntegrationTest

  teardown do
    Rails.cache.clear
  end

  test "should create new post while logged in" do
    post '/login', params: { email: users(:user_one).email, password: 'komuveles'},
         headers: {'HTTP_REFER': '/'}
    assert_response :redirect
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], users(:user_one).id
    follow_redirect!

    post '/new_post', params: { post:
                                    { petname: "Lori",
                                      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                      species: "asdasd", user: users(:user_one),
                                      age: 3,
                                      image: fixture_file_upload('cat1.jpeg', 'image/jpeg') } },
         headers: {'HTTP_REFER': '/'}
    assert_response :redirect
    assert Post.order(:created_at).last.image.attached?
    follow_redirect!
    assert_select '.card', 3
  end
end
