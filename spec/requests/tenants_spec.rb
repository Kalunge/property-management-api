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
      end.to change { Tenant.count }.from(1).to(2)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /tenants/:id' do
    it 'Updates and returns a tenant' do
      put "/api/v1/tenants/#{my_tenant.id}", params: { tenant: { name: 'Newest name' } }
      expect(response).to have_http_status(:success)

      expect(JSON.parse(response.body)).to eq({
                                                'id' => my_tenant.id,
                                                'email' => my_tenant.email,
                                                'phone' => my_tenant.phone,
                                                'name' => 'Newest name',
                                                'deposit' => my_tenant.deposit
                                              })
    end
  end

  describe 'DELETE /tenants/:id' do
    it 'Deletes a tenant based on a given id' do
      delete "/api/v1/tenants/#{my_tenant.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
