require 'test_helper'

class BreakdownsControllerTest < ActionController::TestCase
  setup do
    @breakdown = breakdowns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breakdowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breakdown" do
    assert_difference('Breakdown.count') do
      post :create, :breakdown => @breakdown.attributes
    end

    assert_redirected_to breakdown_path(assigns(:breakdown))
  end

  test "should show breakdown" do
    get :show, :id => @breakdown.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @breakdown.to_param
    assert_response :success
  end

  test "should update breakdown" do
    put :update, :id => @breakdown.to_param, :breakdown => @breakdown.attributes
    assert_redirected_to breakdown_path(assigns(:breakdown))
  end

  test "should destroy breakdown" do
    assert_difference('Breakdown.count', -1) do
      delete :destroy, :id => @breakdown.to_param
    end

    assert_redirected_to breakdowns_path
  end
end
