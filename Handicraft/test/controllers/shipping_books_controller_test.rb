require 'test_helper'

class ShippingBooksControllerTest < ActionController::TestCase
  setup do
    @shipping_book = shipping_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_book" do
    assert_difference('ShippingBook.count') do
      post :create, shipping_book: { customer_id: @shipping_book.customer_id, shipping_address: @shipping_book.shipping_address, shipping_book_id: @shipping_book.shipping_book_id, shipping_city: @shipping_book.shipping_city, shipping_country_region: @shipping_book.shipping_country_region, shipping_name: @shipping_book.shipping_name, shipping_state_province: @shipping_book.shipping_state_province, shipping_zip_postal: @shipping_book.shipping_zip_postal }
    end

    assert_redirected_to shipping_book_path(assigns(:shipping_book))
  end

  test "should show shipping_book" do
    get :show, id: @shipping_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_book
    assert_response :success
  end

  test "should update shipping_book" do
    patch :update, id: @shipping_book, shipping_book: { customer_id: @shipping_book.customer_id, shipping_address: @shipping_book.shipping_address, shipping_book_id: @shipping_book.shipping_book_id, shipping_city: @shipping_book.shipping_city, shipping_country_region: @shipping_book.shipping_country_region, shipping_name: @shipping_book.shipping_name, shipping_state_province: @shipping_book.shipping_state_province, shipping_zip_postal: @shipping_book.shipping_zip_postal }
    assert_redirected_to shipping_book_path(assigns(:shipping_book))
  end

  test "should destroy shipping_book" do
    assert_difference('ShippingBook.count', -1) do
      delete :destroy, id: @shipping_book
    end

    assert_redirected_to shipping_books_path
  end
end
