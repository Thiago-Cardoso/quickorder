FactoryBot.define do
  factory :category do
    sequence(:description) { |n| "Category #{n}" }
  end
end
