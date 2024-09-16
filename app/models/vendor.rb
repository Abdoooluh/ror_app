class Vendor < ApplicationRecord
  belongs_to :city
  has_one :country, through: :city
  has_many :products
  enum vendor_type: { Individual: "Individual", Business: "Business" }

  validates :full_name, :city_id, :full_name, :email, :cell_number, presence: true
  validates :email, uniqueness: true
  validates :cell_number, format: { with: /\A\+\d{1,3}\d{10,14}\z/, message: "phone number must contain a country code and 10-14 digits" }
  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "email", "cell_number", "city", "vendor_type"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["city", "country", "products"]
  end

  has_secure_password
end
