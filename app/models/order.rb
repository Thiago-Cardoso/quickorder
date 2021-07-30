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

  # Enumerate
  enum situation: { 'Na fila': 0, 'Em andamento': 1, 'Concluído': 2, 'Cancelado': 3 }

  def subtotal
    product_orders.collect do |product_order|
      product_order.valid? ? product_order.unit_price * product_order.quantitie : 0
    end.sum
  end

  private

  def set_subtotal
    self[subtotal] = subtotal
  end
end
