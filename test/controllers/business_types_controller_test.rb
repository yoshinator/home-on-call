require 'test_helper'

class BusinessTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_type = business_types(:one)
  end

  test "should get index" do
    get business_types_url
    assert_response :success
  end

  test "should get new" do
    get new_business_type_url
    assert_response :success
  end

  test "should create business_type" do
    assert_difference('BusinessType.count') do
      post business_types_url, params: { business_type: { name: @business_type.name } }
    end

    assert_redirected_to business_type_url(BusinessType.last)
  end

  test "should show business_type" do
    get business_type_url(@business_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_type_url(@business_type)
    assert_response :success
  end

  test "should update business_type" do
    patch business_type_url(@business_type), params: { business_type: { name: @business_type.name } }
    assert_redirected_to business_type_url(@business_type)
  end

  test "should destroy business_type" do
    assert_difference('BusinessType.count', -1) do
      delete business_type_url(@business_type)
    end

    assert_redirected_to business_types_url
  end
end
