require 'test_helper'

class OrderDetailsControllerTest < ActionController::TestCase
  setup do
    @order_detail = order_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_detail" do
    assert_difference('OrderDetail.count') do
      post :create, order_detail: { discount: @order_detail.discount, order_detail_id: @order_detail.order_detail_id, order_detail_status: @order_detail.order_detail_status, order_id: @order_detail.order_id, product_id: @order_detail.product_id, quantity: @order_detail.quantity, tax_status: @order_detail.tax_status, unit_price: @order_detail.unit_price }
    end

    assert_redirected_to order_detail_path(assigns(:order_detail))
  end

  test "should show order_detail" do
    get :show, id: @order_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_detail
    assert_response :success
  end

  test "should update order_detail" do
    patch :update, id: @order_detail, order_detail: { discount: @order_detail.discount, order_detail_id: @order_detail.order_detail_id, order_detail_status: @order_detail.order_detail_status, order_id: @order_detail.order_id, product_id: @order_detail.product_id, quantity: @order_detail.quantity, tax_status: @order_detail.tax_status, unit_price: @order_detail.unit_price }
    assert_redirected_to order_detail_path(assigns(:order_detail))
  end

  test "should destroy order_detail" do
    assert_difference('OrderDetail.count', -1) do
      delete :destroy, id: @order_detail
    end

    assert_redirected_to order_details_path
  end
end
