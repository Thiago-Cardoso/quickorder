class Product < ApplicationRecord
  # Relationship
  belongs_to :category

  # Validates
  validates :name, presence: true 
  validates :description, presence: true
  validates :price, presence: true
end
