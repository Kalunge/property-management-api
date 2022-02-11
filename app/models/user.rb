class User < ApplicationRecord
  has_many :reservations
  has_many :blocks
  has_many :apartments
end
