class ProductOrder < ApplicationRecord
  # Relationship
  belongs_to :product
  belongs_to :order

  # Validates
  validates :quantitie, presence: true
end
