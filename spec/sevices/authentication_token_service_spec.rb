require 'rails_helper'

describe AuthenticationTokenService do
  describe '.encode' do
    let(:token) { described_class.encode(123) }

    it 'returns a token' do
      decoded_token = described_class.decode(token)
      expect(decoded_token).to eq(123)
    end
  end
end
