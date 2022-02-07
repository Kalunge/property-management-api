class Block < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :apartments, dependent: :destroy

  belongs_to :user
end
