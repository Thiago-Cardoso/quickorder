FactoryBot.define do
  factory :product_order do
    quantitie { 1 }
    note { "MyString" }
    product { nil }
    order { nil }
  end
end
