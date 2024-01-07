FactoryBot.define do
  factory :chat_room, class: 'Chat::Room' do
    sequence(:name) do |n|
      "#{Faker::Lorem.word}#{n}"
    end
    private { false }

    trait :private do
      name { "Private Room" }
      private { true }
    end
  end
end
