require 'test_helper'

class MatchCardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_card" do
    assert_difference('MatchCard.count') do
      post :create, :match_card => { }
    end

    assert_redirected_to match_card_path(assigns(:match_card))
  end

  test "should show match_card" do
    get :show, :id => match_cards(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => match_cards(:one).to_param
    assert_response :success
  end

  test "should update match_card" do
    put :update, :id => match_cards(:one).to_param, :match_card => { }
    assert_redirected_to match_card_path(assigns(:match_card))
  end

  test "should destroy match_card" do
    assert_difference('MatchCard.count', -1) do
      delete :destroy, :id => match_cards(:one).to_param
    end

    assert_redirected_to match_cards_path
  end
end
