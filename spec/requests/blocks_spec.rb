require 'rails_helper'

describe 'Blocks API', type: :request do
  let!(:user_one) {FactoryBot.create(:user, name: "Grace Acibi")}
  let!(:block_one) {FactoryBot.create(:block, name: "Macom Apartments", location: "KdFarmaco Kikuyu", user_id:user_one.id)}
  describe "GET /blocks" do
    it "returns all blocks" do
      get "/api/v1/blocks"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([])
    end
  end
end
