require 'rails_helper'

describe 'API Authenticate', type: :request do
  let(:user) { FactoryBot.create(:user, name: 'Kalungez', password: 'qwerty') }

  describe 'post /authenticate' do
    it 'takes a username and returns a token' do
      post '/api/v1/authenticate', params: { name: user.name, password: 'qwerty' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
                                                'token' => AuthenticationTokenService.encode(user.id)
                                              })
    end

    it 'Returns an error without passssword' do
      post '/api/v1/authenticate', params: { name: user.name }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
                                                'errors' => 'param is missing or the value is empty: username/password'
                                              })
    end

    it 'Returns an error without username' do
      post '/api/v1/authenticate', params: { password: 'hello' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
                                                'errors' => 'param is missing or the value is empty: username/password'
                                              })
    end

    it 'returns error with incorrect password' do
      post '/api/v1/authenticate', params: { name: user.name, password: '12345' }

      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)).to eq({
                                                'errors' => 'Wrong Email or password'
                                              })
    end
  end
end
