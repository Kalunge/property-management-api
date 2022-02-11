require 'rails_helper'

describe 'Users API', type: :request do
  let!(:user1) { FactoryBot.create(:user, name: 'Kalunge') }
  let!(:user) { FactoryBot.create(:user, name: 'Titus Muthomi') }
  describe 'Get Users' do
    it 'Gets all Users' do
      get '/api/v1/users'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => user1.id,
                                                  'name' => user1.name
                                                },
                                                {
                                                  'id' => user.id,
                                                  'name' => user.name
                                                }
                                              ])
    end
  end

  describe 'get user' do
    it 'Returns user given an id' do
      get "/api/v1/users/#{user1.id}" do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq(
          {
            'id' => user1.id,
            'name' => user1.name
          }
        )
      end
    end

    it 'Returns 404 When user is not found' do
      get '/api/v1/users/:id' do

      expect(response).to have_http_status(:not_found)
      end
    end
  end
end
