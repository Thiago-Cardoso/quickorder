FactoryBot.define do
  factory :product_order do
    quantitie { Faker::Commerce.unique.promotion_code(digits: 1) }
    sequence(:note) { |n| "My Order #{n}" }
    product 
    order 
  end
end
