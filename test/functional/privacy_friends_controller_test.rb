require 'test_helper'

class PrivacyFriendsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privacy_friends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privacy_friend" do
    assert_difference('PrivacyFriend.count') do
      post :create, :privacy_friend => { }
    end

    assert_redirected_to privacy_friend_path(assigns(:privacy_friend))
  end

  test "should show privacy_friend" do
    get :show, :id => privacy_friends(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => privacy_friends(:one).to_param
    assert_response :success
  end

  test "should update privacy_friend" do
    put :update, :id => privacy_friends(:one).to_param, :privacy_friend => { }
    assert_redirected_to privacy_friend_path(assigns(:privacy_friend))
  end

  test "should destroy privacy_friend" do
    assert_difference('PrivacyFriend.count', -1) do
      delete :destroy, :id => privacy_friends(:one).to_param
    end

    assert_redirected_to privacy_friends_path
  end
end
