class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order

  validates :name, presence: true

  validates :type, presence: true
  enum type: { admin: 0, clerk: 1, cooker: 2}
end
