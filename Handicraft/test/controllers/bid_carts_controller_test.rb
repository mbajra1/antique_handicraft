require 'test_helper'

class BidCartsControllerTest < ActionController::TestCase
  setup do
    @bid_cart = bid_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_cart" do
    assert_difference('BidCart.count') do
      post :create, bid_cart: { bid_end_date: @bid_cart.bid_end_date, bid_product_id: @bid_cart.bid_product_id, opening_price: @bid_cart.opening_price }
    end

    assert_redirected_to bid_cart_path(assigns(:bid_cart))
  end

  test "should show bid_cart" do
    get :show, id: @bid_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_cart
    assert_response :success
  end

  test "should update bid_cart" do
    patch :update, id: @bid_cart, bid_cart: { bid_end_date: @bid_cart.bid_end_date, bid_product_id: @bid_cart.bid_product_id, opening_price: @bid_cart.opening_price }
    assert_redirected_to bid_cart_path(assigns(:bid_cart))
  end

  test "should destroy bid_cart" do
    assert_difference('BidCart.count', -1) do
      delete :destroy, id: @bid_cart
    end

    assert_redirected_to bid_carts_path
  end
end
