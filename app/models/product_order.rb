class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantitie, presence: true
end
