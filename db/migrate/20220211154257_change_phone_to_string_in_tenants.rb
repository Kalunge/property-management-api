class ChangePhoneToStringInTenants < ActiveRecord::Migration[6.1]
  def change
    change_column :tenants, :phone, :string
  end
end
