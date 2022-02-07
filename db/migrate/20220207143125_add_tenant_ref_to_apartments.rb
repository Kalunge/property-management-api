class AddTenantRefToApartments < ActiveRecord::Migration[6.1]
  def change
    add_reference :apartments, :tenant, null: true, foreign_key: true
  end
end
