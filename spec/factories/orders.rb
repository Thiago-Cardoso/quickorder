FactoryBot.define do
  factory :order do
    client_name { Faker::Name.name }
    sequence(:table_number) { |n| "table_number #{n}" }
    situation { :progress }
    employee
  end
end

