class User < ApplicationRecord
  belongs_to :city
  has_one :country, through: :city
  has_secure_password

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cell_number, presence: true, format: { with: /\A\+\d{1,3}\d{10,14}\z/, message: "phone number must contain a country code and 10-14 digits" }
end
