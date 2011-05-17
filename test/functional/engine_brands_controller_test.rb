require 'test_helper'

class EngineBrandsControllerTest < ActionController::TestCase
  setup do
    @engine_brand = engine_brands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engine_brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engine_brand" do
    assert_difference('EngineBrand.count') do
      post :create, :engine_brand => @engine_brand.attributes
    end

    assert_redirected_to engine_brand_path(assigns(:engine_brand))
  end

  test "should show engine_brand" do
    get :show, :id => @engine_brand.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @engine_brand.to_param
    assert_response :success
  end

  test "should update engine_brand" do
    put :update, :id => @engine_brand.to_param, :engine_brand => @engine_brand.attributes
    assert_redirected_to engine_brand_path(assigns(:engine_brand))
  end

  test "should destroy engine_brand" do
    assert_difference('EngineBrand.count', -1) do
      delete :destroy, :id => @engine_brand.to_param
    end

    assert_redirected_to engine_brands_path
  end
end
