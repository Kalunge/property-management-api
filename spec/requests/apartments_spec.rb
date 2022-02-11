require 'rails_helper'

describe 'Apartments API', type: :request do
  let!(:user) { FactoryBot.create(:user, name: 'Grace Acibi') }
  let!(:block) { FactoryBot.create(:block, name: 'Macom Apartments', location: 'KdFarmaco Kikuyu', user_id: user.id) }
  let!(:tenant) { FactoryBot.create(:tenant, name: 'Bazenga Bazuu', email: 'test@mail.com', deposit: 200) }
  let!(:apartment_1) do
    FactoryBot.create(:apartment, name: '12', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
  end
  let!(:apartment_2) do
    FactoryBot.create(:apartment, name: '12 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
  end

  describe 'GET /Apartments' do
    it 'Gets all apartments' do
      get '/api/v1/apartments'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'door_number' => apartment_1.name,
                                                  'vacant' => apartment_1.vacant,
                                                  'block_name' => apartment_1.block.name,
                                                  'location' => apartment_1.block.location,
                                                  'rent' => apartment_1.rent
                                                },
                                                {
                                                  'door_number' => apartment_2.name,
                                                  'vacant' => apartment_2.vacant,
                                                  'block_name' => apartment_2.block.name,
                                                  'location' => apartment_2.block.location,
                                                  'rent' => apartment_2.rent
                                                }
                                              ])
    end
  end

  describe 'Get Apartments/:id' do
    it 'Returns apartment based on id' do
      get "/api/v1/apartments/#{apartment_1.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'door_number' => apartment_1.name,
                                                'vacant' => apartment_1.vacant,
                                                'block_name' => apartment_1.block.name,
                                                'location' => apartment_1.block.location,
                                                'rent' => apartment_1.rent
                                              })
    end
  end

  describe 'POST /apartments' do
    let!(:new_block) do
      FactoryBot.create(:block, name: 'Sironi Apartments', location: 'KdFarmaco Kikuyu', user_id: user.id)
    end

    it 'Creates a new apartments' do
      expect do
        post '/api/v1/apartments',
             params: { apartment: { name: '14E', vacant: true, block_id: new_block.id, location: 'Kikuyu',
                                    rent: 15_000 } }
      end.to change { Apartment.count }.from(2).to(3)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        {
          'door_number' => '14E',
          'vacant' => true,
          'block_name' => new_block.name,
          'location' => 'Kikuyu',
          'rent' => 15_000
        }
      )
    end
  end

  describe 'PUT /apartments/:id' do
    let!(:apartment_3) do
      FactoryBot.create(:apartment, name: '15 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
    end
    it 'Edits and returns apartment with new deatils' do
      put "/api/v1/apartments/#{apartment_3.id}", params: { apartment: { name: 'new name' } }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'door_number' => 'new name',
                                                'vacant' => true,
                                                'block_name' => apartment_3.block.name,
                                                'location' => 'Kikuyu',
                                                'rent' => 15_000
                                              })
    end

    it 'Returns 404 and does not crush when id is invalid' do
      put '/api/v1/apartments/20', params: { apartment: { name: 'new name' } }

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'DELETE /apartments/:id' do
    let!(:apartment_5) do
      FactoryBot.create(:apartment, name: '15 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
    end
    it 'Deletes an apartment based on given id' do
      delete "/api/v1/apartments/#{apartment_5.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
