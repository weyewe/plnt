require 'test_helper'

class VehicleUnitsControllerTest < ActionController::TestCase
  setup do
    @vehicle_unit = vehicle_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_unit" do
    assert_difference('VehicleUnit.count') do
      post :create, :vehicle_unit => @vehicle_unit.attributes
    end

    assert_redirected_to vehicle_unit_path(assigns(:vehicle_unit))
  end

  test "should show vehicle_unit" do
    get :show, :id => @vehicle_unit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vehicle_unit.to_param
    assert_response :success
  end

  test "should update vehicle_unit" do
    put :update, :id => @vehicle_unit.to_param, :vehicle_unit => @vehicle_unit.attributes
    assert_redirected_to vehicle_unit_path(assigns(:vehicle_unit))
  end

  test "should destroy vehicle_unit" do
    assert_difference('VehicleUnit.count', -1) do
      delete :destroy, :id => @vehicle_unit.to_param
    end

    assert_redirected_to vehicle_units_path
  end
end
