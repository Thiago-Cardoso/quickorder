class Product < ApplicationRecord
  # Relationship
  belongs_to :category, optional: true
  has_many :product_orders
  has_one_attached :image

  # Validates
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  enum status: { active: 0, inactive: 1 }
end
