require 'test_helper'

class TeesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tee" do
    assert_difference('Tee.count') do
      post :create, :tee => { }
    end

    assert_redirected_to tee_path(assigns(:tee))
  end

  test "should show tee" do
    get :show, :id => tees(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tees(:one).to_param
    assert_response :success
  end

  test "should update tee" do
    put :update, :id => tees(:one).to_param, :tee => { }
    assert_redirected_to tee_path(assigns(:tee))
  end

  test "should destroy tee" do
    assert_difference('Tee.count', -1) do
      delete :destroy, :id => tees(:one).to_param
    end

    assert_redirected_to tees_path
  end
end
