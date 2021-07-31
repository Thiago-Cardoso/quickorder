class Order < ApplicationRecord
  # Relationship
  belongs_to :employee
  before_save :set_subtotal

  has_many :product_orders
  accepts_nested_attributes_for :product_orders, allow_destroy: true, reject_if: :all_blank

  # Validates
  validates :client_name, presence: true
  validates :table_number, presence: true
  validates :situation, presence: true
  before_save :set_total

  # Enumerate
  enum situation: { 'queue': 0, 'progress': 1, 'done': 2, 'cancelled': 3 }

  def subtotal
    product_orders.collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantitie : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    self[:total] = subtotal
  end

  scope :queue, ->{ where(situation: 0)}
  scope :progress, ->{ where(situation: 1)}
  scope :concluded, ->{ where(situation: 2)}
  scope :canceled, ->{ where(situation: 3)}

end
