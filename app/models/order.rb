class Order < ApplicationRecord
  validates :client_name, presence: true 
  validates :table_number, presence: true

  belongs_to :employee
  

  validates :situation, presence: true
  enum situation: { 'Na fila': 0, 'Em andamento': 1, 'Concluído': 2, 'Cancelado': 3}
end
