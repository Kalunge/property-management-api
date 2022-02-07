class Apartment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :tenant, optional: true
end
