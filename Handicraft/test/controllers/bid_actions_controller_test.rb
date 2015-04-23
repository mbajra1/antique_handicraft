require 'test_helper'

class BidActionsControllerTest < ActionController::TestCase
  setup do
    @bid_action = bid_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_action" do
    assert_difference('BidAction.count') do
      post :create, bid_action: { bid_amount: @bid_action.bid_amount, bid_cart_id: @bid_action.bid_cart_id, bidder_id: @bid_action.bidder_id }
    end

    assert_redirected_to bid_action_path(assigns(:bid_action))
  end

  test "should show bid_action" do
    get :show, id: @bid_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_action
    assert_response :success
  end

  test "should update bid_action" do
    patch :update, id: @bid_action, bid_action: { bid_amount: @bid_action.bid_amount, bid_cart_id: @bid_action.bid_cart_id, bidder_id: @bid_action.bidder_id }
    assert_redirected_to bid_action_path(assigns(:bid_action))
  end

  test "should destroy bid_action" do
    assert_difference('BidAction.count', -1) do
      delete :destroy, id: @bid_action
    end

    assert_redirected_to bid_actions_path
  end
end
