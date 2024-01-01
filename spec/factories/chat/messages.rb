FactoryBot.define do
  factory :chat_message, class: 'Chat::Message' do
    room
    body { Faker::Lorem.sentence }
  end
end
