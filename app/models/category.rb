class Category < ApplicationRecord
  # Relationship
  has_many :products

  # Validates
  validates :description, presence: true
end
