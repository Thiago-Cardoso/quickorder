FactoryBot.define do
  factory :order do
    client_name { Faker::Name.name }
    table_number { "MyString" }
    situation { "Na fila"}
    employee
  end
end
