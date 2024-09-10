class User < ApplicationRecord
  belongs_to :city
  has_one :country, through: :city
end
