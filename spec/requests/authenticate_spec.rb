require "rails_helper"

describe "API Authenticate", type: :request do
  let(:user) { FactoryBot.create(:user, name: 'Kalungez') }

  describe "post /authenticate" do
    it "takes a username and returns a token" do
      post "/api/v1/authenticate", params: { name: user.name}

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "token" => AuthenticationTokenService.encode(user.id)
      })
    end
  end
end