class Employee < ApplicationRecord
  belongs_to :order

  validates :name, presence: true

  validates :type, presence: true
  enum type: { admin: 0, clerk: 1, cooker: 2 }
end
