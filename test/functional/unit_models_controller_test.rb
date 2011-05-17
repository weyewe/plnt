require 'test_helper'

class UnitModelsControllerTest < ActionController::TestCase
  setup do
    @unit_model = unit_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_model" do
    assert_difference('UnitModel.count') do
      post :create, :unit_model => @unit_model.attributes
    end

    assert_redirected_to unit_model_path(assigns(:unit_model))
  end

  test "should show unit_model" do
    get :show, :id => @unit_model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @unit_model.to_param
    assert_response :success
  end

  test "should update unit_model" do
    put :update, :id => @unit_model.to_param, :unit_model => @unit_model.attributes
    assert_redirected_to unit_model_path(assigns(:unit_model))
  end

  test "should destroy unit_model" do
    assert_difference('UnitModel.count', -1) do
      delete :destroy, :id => @unit_model.to_param
    end

    assert_redirected_to unit_models_path
  end
end
