FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    code { Faker::Lorem.characters(number: 5) }
    details { Faker::Lorem.paragraph }
  end
end
