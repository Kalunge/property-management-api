class User < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :blocks, dependent: :destroy
  has_many :apartments, dependent: :destroy
end
