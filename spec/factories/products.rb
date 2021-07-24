FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { 1.5 }
    category { nil }
  end
end
