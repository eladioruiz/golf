require 'test_helper'

class HolesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hole" do
    assert_difference('Hole.count') do
      post :create, :hole => { }
    end

    assert_redirected_to hole_path(assigns(:hole))
  end

  test "should show hole" do
    get :show, :id => holes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => holes(:one).to_param
    assert_response :success
  end

  test "should update hole" do
    put :update, :id => holes(:one).to_param, :hole => { }
    assert_redirected_to hole_path(assigns(:hole))
  end

  test "should destroy hole" do
    assert_difference('Hole.count', -1) do
      delete :destroy, :id => holes(:one).to_param
    end

    assert_redirected_to holes_path
  end
end
