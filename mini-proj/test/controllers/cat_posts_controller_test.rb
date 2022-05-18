require 'test_helper'

class CatPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cat_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get cat_posts_create_url
    assert_response :success
  end

end
