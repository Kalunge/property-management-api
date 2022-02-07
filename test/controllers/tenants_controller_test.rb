require 'test_helper'

class TenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant = tenants(:one)
  end

  test 'should get index' do
    get tenants_url, as: :json
    assert_response :success
  end

  test 'should create tenant' do
    assert_difference('Tenant.count') do
      post tenants_url, params: { tenant: {} }, as: :json
    end

    assert_response 201
  end

  test 'should show tenant' do
    get tenant_url(@tenant), as: :json
    assert_response :success
  end

  test 'should update tenant' do
    patch tenant_url(@tenant), params: { tenant: {} }, as: :json
    assert_response 200
  end

  test 'should destroy tenant' do
    assert_difference('Tenant.count', -1) do
      delete tenant_url(@tenant), as: :json
    end

    assert_response 204
  end
end
