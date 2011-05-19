require 'test_helper'

class BreakdownStatusesControllerTest < ActionController::TestCase
  setup do
    @breakdown_status = breakdown_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breakdown_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breakdown_status" do
    assert_difference('BreakdownStatus.count') do
      post :create, :breakdown_status => @breakdown_status.attributes
    end

    assert_redirected_to breakdown_status_path(assigns(:breakdown_status))
  end

  test "should show breakdown_status" do
    get :show, :id => @breakdown_status.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @breakdown_status.to_param
    assert_response :success
  end

  test "should update breakdown_status" do
    put :update, :id => @breakdown_status.to_param, :breakdown_status => @breakdown_status.attributes
    assert_redirected_to breakdown_status_path(assigns(:breakdown_status))
  end

  test "should destroy breakdown_status" do
    assert_difference('BreakdownStatus.count', -1) do
      delete :destroy, :id => @breakdown_status.to_param
    end

    assert_redirected_to breakdown_statuses_path
  end
end
