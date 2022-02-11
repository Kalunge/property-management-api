require 'rails_helper'

describe 'API /tenants', type: :request do
  let!(:my_tenant) do
    FactoryBot.create(:tenant, name: 'Titus Kalunge', email: 'tenant@mail.com', phone: '254713398918', deposit: 180_000)
  end

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

  describe 'GET Tenants/:id' do
    it 'Gets a tenant based on id' do
      get "/api/v1/tenants/#{my_tenant.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
                                                'id' => my_tenant.id,
                                                'email' => my_tenant.email,
                                                'phone' => my_tenant.phone,
                                                'name' => my_tenant.name,
                                                'deposit' => my_tenant.deposit
                                              })
    end
  end

  describe 'CREATE /tenants' do
    it 'Creates and returns a new Tenant' do
      expect do
        post '/api/v1/tenants',
             params: { tenant: { name: 'Faith Muthoni', email: 'Faith@mail.com', phone: '0713266564',
                                 deposit: 12_000 } }
      end.to change {Tenant.count}
    end
  end
end
