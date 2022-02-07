class AddUserRefToApartments < ActiveRecord::Migration[6.1]
  def change
    add_reference :apartments, :user, null: false, foreign_key: true
  end
end
