require 'test_helper'

class MicrositesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:microsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create microsite" do
    assert_difference('Microsite.count') do
      post :create, :microsite => { }
    end

    assert_redirected_to microsite_path(assigns(:microsite))
  end

  test "should show microsite" do
    get :show, :id => microsites(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => microsites(:one).to_param
    assert_response :success
  end

  test "should update microsite" do
    put :update, :id => microsites(:one).to_param, :microsite => { }
    assert_redirected_to microsite_path(assigns(:microsite))
  end

  test "should destroy microsite" do
    assert_difference('Microsite.count', -1) do
      delete :destroy, :id => microsites(:one).to_param
    end

    assert_redirected_to microsites_path
  end
end
