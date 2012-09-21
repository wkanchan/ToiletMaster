require 'test_helper'

class ToiletsControllerTest < ActionController::TestCase
  setup do
    @toilet = toilets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toilets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toilet" do
    assert_difference('Toilet.count') do
      post :create, toilet: { latitude: @toilet.latitude, longitude: @toilet.longitude, name: @toilet.name }
    end

    assert_redirected_to toilet_path(assigns(:toilet))
  end

  test "should show toilet" do
    get :show, id: @toilet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toilet
    assert_response :success
  end

  test "should update toilet" do
    put :update, id: @toilet, toilet: { latitude: @toilet.latitude, longitude: @toilet.longitude, name: @toilet.name }
    assert_redirected_to toilet_path(assigns(:toilet))
  end

  test "should destroy toilet" do
    assert_difference('Toilet.count', -1) do
      delete :destroy, id: @toilet
    end

    assert_redirected_to toilets_path
  end
end
