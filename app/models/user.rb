class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city
  has_one :country, through: :city
  has_many :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["full_name"]
  end

  # Validations
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :cell_number, presence: true, format: { with: /\A\+\d{1,3}\d{10,14}\z/, message: "must contain a country code and 10-14 digits" }
end




