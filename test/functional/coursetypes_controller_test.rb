require 'test_helper'

class CoursetypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coursetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coursetype" do
    assert_difference('Coursetype.count') do
      post :create, :coursetype => { }
    end

    assert_redirected_to coursetype_path(assigns(:coursetype))
  end

  test "should show coursetype" do
    get :show, :id => coursetypes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coursetypes(:one).to_param
    assert_response :success
  end

  test "should update coursetype" do
    put :update, :id => coursetypes(:one).to_param, :coursetype => { }
    assert_redirected_to coursetype_path(assigns(:coursetype))
  end

  test "should destroy coursetype" do
    assert_difference('Coursetype.count', -1) do
      delete :destroy, :id => coursetypes(:one).to_param
    end

    assert_redirected_to coursetypes_path
  end
end
