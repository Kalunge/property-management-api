require "rails_helper"

describe "API Authenticate", type: :request do
  describe "Post authenticate" do
    it "takes a username and returns a token" do
      post "/api/v1/authenticate", params: { user: {username: "kalunge"} }

      expect(response).to have_http_status(:created)
    end
  end
end