FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    description { Faker::Food.dish }
    price { Faker::Commerce.price(range: 100.0..400.0) }
    status { :active }
    category
  end
end
