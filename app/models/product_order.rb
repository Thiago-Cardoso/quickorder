class ProductOrder < ApplicationRecord
  # Relationship
  belongs_to :product
  belongs_to :order
  before_save :set_unit_price
  before_save :set_total

  # Validates
  validates :quantitie, presence: true

  def unit_price
    # If there is a record
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total
    unit_price * quantitie
  end



  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total * quantitie
  end
end
