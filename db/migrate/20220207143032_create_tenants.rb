class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :deposit

      t.timestamps
    end
  end
end
