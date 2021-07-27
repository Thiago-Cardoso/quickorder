class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relationship
  has_many :order

  # Validates
  validates :name, presence: true
  validates :occupation, presence: true

  # Enumerate
  enum occupation: { admin: 0, clerk: 1, cooker: 2 }
  enum status: { 'Inativo': 0, 'Ativo': 1 }
end
