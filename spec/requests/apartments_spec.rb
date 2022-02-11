require "rails_helper" 

describe "Apartments API", type: :request do
  let!(:user) { FactoryBot.create(:user, name: 'Grace Acibi') }
  let!(:block) {FactoryBot.create(:block, name: 'Macom Apartments', location: 'KdFarmaco Kikuyu', user_id: user.id)}
  let!(:tenant) {FactoryBot.create(:tenant, name: "Bazenga Bazuu", email: "test@mail.com", deposit: 200)}
  let!(:apartment_1) {FactoryBot.create(:apartment, name:"12", vacant: true, block_id: block.id, location: "Kikuyu", rent: 15000)}
  
  describe "GET /Apartments" do
    it "Gets all apartments" do
      get "/api/v1/apartments"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
        {
        "door_number" => apartment_1.name,
        "vacant" => apartment_1.vacant,
        "block_name" => apartment_1.block.name,
        "location" => apartment_1.block.location,
        "rent" => apartment_1.rent
      }
      ])


    end
  end
end