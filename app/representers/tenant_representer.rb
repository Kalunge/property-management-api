class TenantRepresenter
  def initialize(tenant)
    @tenant = tenant
  end

  def as_json
    {
      id: tenant.id,
      email: tenant.email,
      phone: tenant.phone,
      name: tenant.name,
      deposit: tenant.deposit
    }
  end

  private

  attr_reader :tenant
end
