require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cars_new_url
    assert_response :success
  end

  test "should get show" do
    get cars_show_url
    assert_response :success
  end

  test "should get index" do
    get cars_index_url
    assert_response :success
  end

  test "should get edit" do
    get cars_edit_url
    assert_response :success
  end

end
