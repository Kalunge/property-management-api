class TenantsRepresenter
  def initialize(tenants)
    @tenants = tenants
  end

  def as_json
    tenants.map do |tenant|
      {
        id: tenant.id,
        email: tenant.email,
        phone: tenant.phone,
        name: tenant.name,
        deposit: tenant.deposit
      }
    end
  end

  private

  attr_reader :tenants
end
