require "application_system_test_case"

class CategoryProductsTest < ApplicationSystemTestCase
  setup do
    @category_product = category_products(:one)
  end

  test "visiting the index" do
    visit category_products_url
    assert_selector "h1", text: "Category Products"
  end

  test "creating a Category product" do
    visit category_products_url
    click_on "New Category Product"

    click_on "Create Category product"

    assert_text "Category product was successfully created"
    click_on "Back"
  end

  test "updating a Category product" do
    visit category_products_url
    click_on "Edit", match: :first

    click_on "Update Category product"

    assert_text "Category product was successfully updated"
    click_on "Back"
  end

  test "destroying a Category product" do
    visit category_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category product was successfully destroyed"
  end
end
