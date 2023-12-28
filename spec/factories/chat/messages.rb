FactoryBot.define do
  factory :chat_message, class: 'Chat::Message' do
    room { nil }
    body { "MyText" }
  end
end
