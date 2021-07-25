class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :order, optional: true

  enum type: { admin: 0, clerk: 1, cooker: 2}
end
