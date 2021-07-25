class Employee < ApplicationRecord
  belongs_to :order

  validates :name, presence: true

  validates :type, presence: true
  enum type: { 'Gerente': 0, 'Cozinheiro': 1, 'Atendente': 2}
end
