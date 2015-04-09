require 'test_helper'

class StateTaxesControllerTest < ActionController::TestCase
  setup do
    @state_tax = state_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_tax" do
    assert_difference('StateTax.count') do
      post :create, state_tax: { state_code: @state_tax.state_code, tax_rate: @state_tax.tax_rate }
    end

    assert_redirected_to state_tax_path(assigns(:state_tax))
  end

  test "should show state_tax" do
    get :show, id: @state_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state_tax
    assert_response :success
  end

  test "should update state_tax" do
    patch :update, id: @state_tax, state_tax: { state_code: @state_tax.state_code, tax_rate: @state_tax.tax_rate }
    assert_redirected_to state_tax_path(assigns(:state_tax))
  end

  test "should destroy state_tax" do
    assert_difference('StateTax.count', -1) do
      delete :destroy, id: @state_tax
    end

    assert_redirected_to state_taxes_path
  end
end
