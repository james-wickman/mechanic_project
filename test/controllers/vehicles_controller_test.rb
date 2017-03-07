require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get vehicles_create_url
    assert_response :success
  end

  test "should get show" do
    get vehicles_show_url
    assert_response :success
  end

  test "should get update" do
    get vehicles_update_url
    assert_response :success
  end

end
