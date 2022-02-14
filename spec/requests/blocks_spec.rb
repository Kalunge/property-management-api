require 'rails_helper'

describe 'Blocks API', type: :request do
  let!(:user_one) { FactoryBot.create(:user, name: 'Grace Acibi', password: "qwerty") }
  let!(:block_one) do
    FactoryBot.create(:block, name: 'Macom Apartments', location: 'KdFarmaco Kikuyu', user_id: user_one.id)
  end
  let!(:block_two) do
    FactoryBot.create(:block, name: 'Waringa Apartments', location: 'KdFarmaco Kikuyu', user_id: user_one.id)
  end
  let!(:block_three) do
    FactoryBot.create(:block, name: 'Kidron Valley Apartments', location: 'KdFarmaco Kikuyu', user_id: user_one.id)
  end
  describe 'GET /blocks' do
    it 'returns all blocks' do
      get '/api/v1/blocks'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => block_one.id,
                                                  'location' => block_one.location,
                                                  'name' => block_one.name,
                                                  'owner' => user_one.name
                                                },
                                                {
                                                  'id' => block_two.id,
                                                  'location' => block_two.location,
                                                  'name' => block_two.name,
                                                  'owner' => user_one.name
                                                },
                                                {
                                                  'id' => block_three.id,
                                                  'location' => block_three.location,
                                                  'name' => block_three.name,
                                                  'owner' => user_one.name
                                                }
                                              ])
    end
  end

  describe 'GET BLOCKS/:id' do
    it 'Gets one block based on id' do
      get "/api/v1/blocks/#{block_one.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'id' => block_one.id,
                                                'location' => block_one.location,
                                                'name' => block_one.name,
                                                'owner' => user_one.name
                                              })
    end

    it 'Does not crash when Id is not found' do
      get '/api/v1/blocks/100'

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /blocks' do
    it 'Creates a new block' do
      expect do
        post '/api/v1/blocks', params: { block: { name: 'Glory House', location: 'THogoto', user_id: user_one.id } }
      end.to change { Block.count }.from(3).to(4)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /blocks/:id' do
    it 'Updates and returns block with new details' do
      put "/api/v1/blocks/#{block_three.id}", params: { block: { name: 'New name' } }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'id' => block_three.id,
                                                'location' => block_three.location,
                                                'name' => 'New name',
                                                'owner' => user_one.name
                                              })
    end
  end

  describe 'DELETE /blocks/:id' do
    it 'Deletes a block based on provided id' do
      expect do
        delete "/api/v1/blocks/#{block_one.id}"
      end.to change { Block.count }.from(3).to(2)
    end
  end
end
