class AddUserRefToBlocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :blocks, :user, null: false, foreign_key: true
  end
end
