class Block < ApplicationRecord
  has_many :reservations
  has_many :apartments

  belongs_to :user
end
