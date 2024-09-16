require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one) # Ensure your fixture has the new attributes or create a valid product in setup
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { 
        sku: "123456", 
        name: "Test Product", 
        description: "A description of the product", 
        unit_cost: 9.99, 
        vendor_id: vendors(:one).id # Ensure you have a valid vendor fixture
      } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { 
      sku: @product.sku, 
      name: "Updated Name", 
      description: "Updated Description", 
      unit_cost: 19.99, 
      vendor_id: @product.vendor_id 
    } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
