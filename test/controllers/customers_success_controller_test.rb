require 'test_helper'

class CustomersSuccessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_success = customers_success(:one)
  end

  test "should get index" do
    get customers_success_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_success_url
    assert_response :success
  end

  test "should create customer_success" do
    assert_difference('CustomerSuccess.count') do
      post customers_success_url, params: { customer_success: { nivel: @customer_success.nivel, nome: @customer_success.nome, status: @customer_success.status } }
    end

    assert_redirected_to customer_success_url(CustomerSuccess.last)
  end

  test "should show customer_success" do
    get customer_success_url(@customer_success)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_success_url(@customer_success)
    assert_response :success
  end

  test "should update customer_success" do
    patch customer_success_url(@customer_success), params: { customer_success: { nivel: @customer_success.nivel, nome: @customer_success.nome, status: @customer_success.status } }
    assert_redirected_to customer_success_url(@customer_success)
  end

  test "should destroy customer_success" do
    assert_difference('CustomerSuccess.count', -1) do
      delete customer_success_url(@customer_success)
    end

    assert_redirected_to customers_success_url
  end
end
