class Product < ApplicationRecord
  # Relationship
  belongs_to :category, optional: true
  has_many :product_orders

  # Validates
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
