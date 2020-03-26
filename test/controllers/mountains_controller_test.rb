require 'test_helper'

class MountainsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mountains_create_url
    assert_response :success
  end

  test "should get update" do
    get mountains_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mountains_destroy_url
    assert_response :success
  end

end
