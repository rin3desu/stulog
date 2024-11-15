require "test_helper"

class YoutubesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtubes_index_url
    assert_response :success
  end

  test "should get new" do
    get youtubes_new_url
    assert_response :success
  end

  test "should get show" do
    get youtubes_show_url
    assert_response :success
  end

  test "should get edit" do
    get youtubes_edit_url
    assert_response :success
  end
end
