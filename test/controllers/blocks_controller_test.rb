require 'test_helper'

class BlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block = blocks(:one)
  end

  test 'should get index' do
    get blocks_url, as: :json
    assert_response :success
  end

  test 'should create block' do
    assert_difference('Block.count') do
      post blocks_url, params: { block: {} }, as: :json
    end

    assert_response 201
  end

  test 'should show block' do
    get block_url(@block), as: :json
    assert_response :success
  end

  test 'should update block' do
    patch block_url(@block), params: { block: {} }, as: :json
    assert_response 200
  end

  test 'should destroy block' do
    assert_difference('Block.count', -1) do
      delete block_url(@block), as: :json
    end

    assert_response 204
  end
end
