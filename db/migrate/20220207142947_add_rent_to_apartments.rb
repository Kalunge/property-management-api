class AddRentToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :rent, :integer
  end
end
