class Category < ApplicationRecord
  validates :description, presence: true 
end
