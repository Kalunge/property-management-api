require 'rails_helper'

describe "Users API", type: :request do
  let!(:user1) {FactoryBot.create(:user, name: "Kalunge")}
  before do
    FactoryBot.create(:user, name: "Titus Muthomi")
  end
  describe 'Get Users' do
    it "Gets all Users" do
      get '/api/v1/users'
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body)).to eq([
        {
          "name" => "kalunge"
        },
        {
          "name" => "Titus Muthomi"
        }
      ])

    end
  end
end