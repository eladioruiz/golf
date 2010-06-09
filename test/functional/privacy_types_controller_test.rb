require 'test_helper'

class PrivacyTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privacy_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privacy_type" do
    assert_difference('PrivacyType.count') do
      post :create, :privacy_type => { }
    end

    assert_redirected_to privacy_type_path(assigns(:privacy_type))
  end

  test "should show privacy_type" do
    get :show, :id => privacy_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => privacy_types(:one).to_param
    assert_response :success
  end

  test "should update privacy_type" do
    put :update, :id => privacy_types(:one).to_param, :privacy_type => { }
    assert_redirected_to privacy_type_path(assigns(:privacy_type))
  end

  test "should destroy privacy_type" do
    assert_difference('PrivacyType.count', -1) do
      delete :destroy, :id => privacy_types(:one).to_param
    end

    assert_redirected_to privacy_types_path
  end
end
