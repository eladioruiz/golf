require 'test_helper'

class DummiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dummies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dummy" do
    assert_difference('Dummy.count') do
      post :create, :dummy => { }
    end

    assert_redirected_to dummy_path(assigns(:dummy))
  end

  test "should show dummy" do
    get :show, :id => dummies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dummies(:one).to_param
    assert_response :success
  end

  test "should update dummy" do
    put :update, :id => dummies(:one).to_param, :dummy => { }
    assert_redirected_to dummy_path(assigns(:dummy))
  end

  test "should destroy dummy" do
    assert_difference('Dummy.count', -1) do
      delete :destroy, :id => dummies(:one).to_param
    end

    assert_redirected_to dummies_path
  end
end
