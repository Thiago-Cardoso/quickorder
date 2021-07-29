class Order < ApplicationRecord
  # Relationship
  belongs_to :employee
  has_many :product_orders
  accepts_nested_attributes_for :product_orders, reject_if: :all_blank, allow_destroy: true

  # Validates
  validates :client_name, presence: true
  validates :table_number, presence: true
  validates :situation, presence: true

  # Enumerate
  enum situation: { 'Na fila': 0, 'Em andamento': 1, 'Concluído': 2, 'Cancelado': 3 }

  scope :na_fila, ->{ where(situation: 0)}
  scope :em_andamento, ->{ where(situation: 1)}
  scope :concluido, ->{ where(situation: 2)}
  scope :cancelado, ->{ where(situation: 3)}

end
