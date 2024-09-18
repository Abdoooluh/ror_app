class Vendor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city
  has_one :country, through: :city
  has_many :products

  enum vendor_type: { individual: "Individual", business: "Business" }

  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "email", "cell_number", "city", "vendor_type"]
  end

  # Validations
  validates :full_name, :city_id, :email, :cell_number, presence: true
  validates :email, uniqueness: true
  validates :cell_number, format: { with: /\A\+\d{1,3}\d{10,14}\z/, message: "must contain a country code and 10-14 digits" }
end