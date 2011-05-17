require 'test_helper'

class EngineModelsControllerTest < ActionController::TestCase
  setup do
    @engine_model = engine_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engine_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engine_model" do
    assert_difference('EngineModel.count') do
      post :create, :engine_model => @engine_model.attributes
    end

    assert_redirected_to engine_model_path(assigns(:engine_model))
  end

  test "should show engine_model" do
    get :show, :id => @engine_model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @engine_model.to_param
    assert_response :success
  end

  test "should update engine_model" do
    put :update, :id => @engine_model.to_param, :engine_model => @engine_model.attributes
    assert_redirected_to engine_model_path(assigns(:engine_model))
  end

  test "should destroy engine_model" do
    assert_difference('EngineModel.count', -1) do
      delete :destroy, :id => @engine_model.to_param
    end

    assert_redirected_to engine_models_path
  end
end
