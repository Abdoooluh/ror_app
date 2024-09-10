class City < ApplicationRecord
  belongs_to :country
  has_many :users
  has_many :vendors
end
