class Apartment < ApplicationRecord
  has_many :reservations
  belongs_to :tenant, optional: true
  belongs_to :block
end
