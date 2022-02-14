require 'rails_helper'

describe 'Apartments API', type: :request do
  let!(:user) { FactoryBot.create(:user, name: 'Grace Acibi', password: 'qwerty') }
  let!(:block) { FactoryBot.create(:block, name: 'Macom Apartments', location: 'KdFarmaco Kikuyu', user_id: user.id) }
  let!(:tenant) { FactoryBot.create(:tenant, name: 'Bazenga Bazuu', email: 'test@mail.com', deposit: 200) }
  let!(:apartmentone) do
    FactoryBot.create(:apartment, name: '12', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
  end
  let!(:apartmenttwo) do
    FactoryBot.create(:apartment, name: '12 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
  end

  describe 'GET /Apartments' do
    it 'Gets all apartments' do
      get '/api/v1/apartments'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'door_number' => apartmentone.name,
                                                  'vacant' => apartmentone.vacant,
                                                  'block_name' => apartmentone.block.name,
                                                  'location' => apartmentone.block.location,
                                                  'rent' => apartmentone.rent
                                                },
                                                {
                                                  'door_number' => apartmenttwo.name,
                                                  'vacant' => apartmenttwo.vacant,
                                                  'block_name' => apartmenttwo.block.name,
                                                  'location' => apartmenttwo.block.location,
                                                  'rent' => apartmenttwo.rent
                                                }
                                              ])
    end
  end

  describe 'Get Apartments/:id' do
    it 'Returns apartment based on id' do
      get "/api/v1/apartments/#{apartmentone.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'door_number' => apartmentone.name,
                                                'vacant' => apartmentone.vacant,
                                                'block_name' => apartmentone.block.name,
                                                'location' => apartmentone.location,
                                                'rent' => apartmentone.rent
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
    let!(:apartmentthree) do
      FactoryBot.create(:apartment, name: '15 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
    end
    it 'Edits and returns apartment with new deatils' do
      put "/api/v1/apartments/#{apartmentthree.id}", params: { apartment: { name: 'new name' } }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'door_number' => 'new name',
                                                'vacant' => true,
                                                'block_name' => apartmentthree.block.name,
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
    let!(:apartment_five) do
      FactoryBot.create(:apartment, name: '15 E', vacant: true, block_id: block.id, location: 'Kikuyu', rent: 15_000)
    end
    it 'Deletes an apartment based on given id' do
      delete "/api/v1/apartments/#{apartment_five.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
