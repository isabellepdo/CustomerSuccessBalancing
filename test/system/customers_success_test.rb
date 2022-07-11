require "application_system_test_case"

class CustomersSuccessTest < ApplicationSystemTestCase
  setup do
    @customer_success = customers_success(:one)
  end

  test "visiting the index" do
    visit customers_success_url
    assert_selector "h1", text: "Customers Success"
  end

  test "creating a Customer success" do
    visit customers_success_url
    click_on "New Customer Success"

    fill_in "Nivel", with: @customer_success.nivel
    fill_in "Nome", with: @customer_success.nome
    fill_in "Status", with: @customer_success.status
    click_on "Create Customer success"

    assert_text "Customer success was successfully created"
    click_on "Back"
  end

  test "updating a Customer success" do
    visit customers_success_url
    click_on "Edit", match: :first

    fill_in "Nivel", with: @customer_success.nivel
    fill_in "Nome", with: @customer_success.nome
    fill_in "Status", with: @customer_success.status
    click_on "Update Customer success"

    assert_text "Customer success was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer success" do
    visit customers_success_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer success was successfully destroyed"
  end
end
