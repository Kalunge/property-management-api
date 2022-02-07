class AddBlockRefToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :block, null: false, foreign_key: true
  end
end
