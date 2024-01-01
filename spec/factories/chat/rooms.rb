FactoryBot.define do
  factory :chat_room, class: 'Chat::Room' do
    name { Faker::Lorem.word }
    private { false }

    trait :private do
      name { "Private Room" }
      private { true }
    end
  end
end
