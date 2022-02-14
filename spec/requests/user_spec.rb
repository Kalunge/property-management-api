require 'rails_helper'

describe 'Users API', type: :request do
  let!(:user1) { FactoryBot.create(:user, name: 'Kalunge', password: "qwerty") }
  let!(:user) { FactoryBot.create(:user, name: 'Titus Muthomi', password: "qwerty") }
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

  describe 'Post Creates a User' do
    it 'Creates and returns the newly created user' do
      expect do
        post '/api/v1/users', params: { user: { name: 'Eric Muthomi' , password: "qwerty"} }
      end.to change { User.count }.from(2).to(3)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
                                                'id' => 24,
                                                'name' => 'Eric Muthomi'
                                              })
    end

    it 'Rescues from Params missing error' do
      post '/api/v1/users', params: {}

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'Put /users' do
    let(:edit_user) { FactoryBot.create(:user, name: 'My old name', password: "qwerty") }
    it 'edits a selected user' do
      put "/api/v1/users/#{edit_user.id}", params: { user: { name: 'my new name' , password: "qwerty"} }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'id' => edit_user.id,
                                                'name' => 'my new name'
                                              })
    end
  end

  describe 'DELETE /users/id' do
    let!(:to_be_deleted) { FactoryBot.create(:user, name: 'Deleted user', password: "qwerty") }
    it 'Deletes a user' do
      expect do
        delete "/api/v1/users/#{to_be_deleted.id}", headers: {"Authorization" => "Bearer #{AuthenticationTokenService.encode(user.id)}"}
      end.to change { User.count }.from(3).to(2)
      expect(response).to have_http_status(:success)
    end

    it "Returns when token is nil" do
      delete "/api/v1/users/#{to_be_deleted.id}", headers:  {}

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
