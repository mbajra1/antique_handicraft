require 'test_helper'

class OrderShipmentsControllerTest < ActionController::TestCase
  setup do
    @order_shipment = order_shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_shipment" do
    assert_difference('OrderShipment.count') do
      post :create, order_shipment: { customer_id: @order_shipment.customer_id, order_id: @order_shipment.order_id, shipment_id: @order_shipment.shipment_id, shipper_name: @order_shipment.shipper_name, shipping_address: @order_shipment.shipping_address, shipping_city: @order_shipment.shipping_city, shipping_name: @order_shipment.shipping_name, shipping_state_province: @order_shipment.shipping_state_province, shipping_type: @order_shipment.shipping_type }
    end

    assert_redirected_to order_shipment_path(assigns(:order_shipment))
  end

  test "should show order_shipment" do
    get :show, id: @order_shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_shipment
    assert_response :success
  end

  test "should update order_shipment" do
    patch :update, id: @order_shipment, order_shipment: { customer_id: @order_shipment.customer_id, order_id: @order_shipment.order_id, shipment_id: @order_shipment.shipment_id, shipper_name: @order_shipment.shipper_name, shipping_address: @order_shipment.shipping_address, shipping_city: @order_shipment.shipping_city, shipping_name: @order_shipment.shipping_name, shipping_state_province: @order_shipment.shipping_state_province, shipping_type: @order_shipment.shipping_type }
    assert_redirected_to order_shipment_path(assigns(:order_shipment))
  end

  test "should destroy order_shipment" do
    assert_difference('OrderShipment.count', -1) do
      delete :destroy, id: @order_shipment
    end

    assert_redirected_to order_shipments_path
  end
end
