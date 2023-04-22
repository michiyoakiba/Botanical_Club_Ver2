require "test_helper"

class Public::PlantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_plants_new_url
    assert_response :success
  end

  test "should get index" do
    get public_plants_index_url
    assert_response :success
  end

  test "should get show" do
    get public_plants_show_url
    assert_response :success
  end
end
