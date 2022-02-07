class Reservation < ApplicationRecord
  belongs_to :user, :apartment, :block
end
