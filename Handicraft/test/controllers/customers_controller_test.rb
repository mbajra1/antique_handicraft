require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address: @customer.address, business_phone: @customer.business_phone, cell_phone: @customer.cell_phone, city: @customer.city, company: @customer.company, country_region: @customer.country_region, customer_id: @customer.customer_id, email: @customer.email, fax: @customer.fax, first_name: @customer.first_name, home_phone: @customer.home_phone, last_name: @customer.last_name, state_province: @customer.state_province, zip_postal_code: @customer.zip_postal_code }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address: @customer.address, business_phone: @customer.business_phone, cell_phone: @customer.cell_phone, city: @customer.city, company: @customer.company, country_region: @customer.country_region, customer_id: @customer.customer_id, email: @customer.email, fax: @customer.fax, first_name: @customer.first_name, home_phone: @customer.home_phone, last_name: @customer.last_name, state_province: @customer.state_province, zip_postal_code: @customer.zip_postal_code }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
