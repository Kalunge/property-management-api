require 'rails_helper'

describe 'API /tenants', type: :request do
  let!(:my_tenant) { FactoryBot.create(:tenant, name: 'Titus Kalunge', email: 'tenant@mail.com', phone: "254713398918", deposit: 180_000) }

  describe 'GET /Tenants' do
    it 'Gets all tenants' do
      get '/api/v1/tenants'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => my_tenant.id,
                                                  'email' => my_tenant.email,
                                                  'phone' => my_tenant.phone,
                                                  'name' => my_tenant.name,
                                                  'deposit' => my_tenant.deposit
                                                }
                                              ])
    end
  end
end
