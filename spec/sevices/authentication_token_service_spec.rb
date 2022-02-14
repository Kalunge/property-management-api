require 'rails_helper'

describe AuthenticatioTokenService do
  describe '.encode' do
    let(:token) { described_class.encode(123) }

    it 'returns a token' do
      decoded_token = JWT.decoded_token, described_class::HMAC_SECRET, true,
                      { algorithm: described_class::ALGORTHIM_TYPE }
      expect(decoded_token).to eq([
                                    { 'user_id' => 123 }, { 'alg' => 'HS256' }
                                  ])
    end
  end
end
