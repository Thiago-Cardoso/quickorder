FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    occupation { :admin }
    email { Faker::Internet.email }
    password { "123456" }
    status { :active }
  end
end
