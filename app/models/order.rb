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
  enum situation: { queue: 0, progress: 1, concluded: 2, canceled: 3 }

  scope :na_fila, ->{ where(situation: 0)}
  scope :em_andamento, ->{ where(situation: 1)}
  scope :concluido, ->{ where(situation: 2)}
  scope :cancelado, ->{ where(situation: 3)}

end
