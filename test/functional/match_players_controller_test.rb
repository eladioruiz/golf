require 'test_helper'

class MatchPlayersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_player" do
    assert_difference('MatchPlayer.count') do
      post :create, :match_player => { }
    end

    assert_redirected_to match_player_path(assigns(:match_player))
  end

  test "should show match_player" do
    get :show, :id => match_players(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => match_players(:one).to_param
    assert_response :success
  end

  test "should update match_player" do
    put :update, :id => match_players(:one).to_param, :match_player => { }
    assert_redirected_to match_player_path(assigns(:match_player))
  end

  test "should destroy match_player" do
    assert_difference('MatchPlayer.count', -1) do
      delete :destroy, :id => match_players(:one).to_param
    end

    assert_redirected_to match_players_path
  end
end
