require 'test_helper'

class SellersControllerTest < ActionController::TestCase
  setup do
    @seller = sellers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sellers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller" do
    assert_difference('Seller.count') do
      post :create, seller: { address: @seller.address, business_phone: @seller.business_phone, cell_phone: @seller.cell_phone, city: @seller.city, company: @seller.company, country_region: @seller.country_region, email: @seller.email, fax: @seller.fax, first_name: @seller.first_name, home_phone: @seller.home_phone, last_name: @seller.last_name, seller_id: @seller.seller_id, state_province: @seller.state_province, zip_postal_code: @seller.zip_postal_code }
    end

    assert_redirected_to seller_path(assigns(:seller))
  end

  test "should show seller" do
    get :show, id: @seller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller
    assert_response :success
  end

  test "should update seller" do
    patch :update, id: @seller, seller: { address: @seller.address, business_phone: @seller.business_phone, cell_phone: @seller.cell_phone, city: @seller.city, company: @seller.company, country_region: @seller.country_region, email: @seller.email, fax: @seller.fax, first_name: @seller.first_name, home_phone: @seller.home_phone, last_name: @seller.last_name, seller_id: @seller.seller_id, state_province: @seller.state_province, zip_postal_code: @seller.zip_postal_code }
    assert_redirected_to seller_path(assigns(:seller))
  end

  test "should destroy seller" do
    assert_difference('Seller.count', -1) do
      delete :destroy, id: @seller
    end

    assert_redirected_to sellers_path
  end
end
