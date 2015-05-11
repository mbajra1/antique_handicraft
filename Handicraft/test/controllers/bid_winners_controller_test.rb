require 'test_helper'

class BidWinnersControllerTest < ActionController::TestCase
  setup do
    @bid_winner = bid_winners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_winners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_winner" do
    assert_difference('BidWinner.count') do
      post :create, bid_winner: { bid_cart_id: @bid_winner.bid_cart_id, bid_product: @bid_winner.bid_product, winner_id: @bid_winner.winner_id, winning_amount: @bid_winner.winning_amount }
    end

    assert_redirected_to bid_winner_path(assigns(:bid_winner))
  end

  test "should show bid_winner" do
    get :show, id: @bid_winner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_winner
    assert_response :success
  end

  test "should update bid_winner" do
    patch :update, id: @bid_winner, bid_winner: { bid_cart_id: @bid_winner.bid_cart_id, bid_product: @bid_winner.bid_product, winner_id: @bid_winner.winner_id, winning_amount: @bid_winner.winning_amount }
    assert_redirected_to bid_winner_path(assigns(:bid_winner))
  end

  test "should destroy bid_winner" do
    assert_difference('BidWinner.count', -1) do
      delete :destroy, id: @bid_winner
    end

    assert_redirected_to bid_winners_path
  end
end
