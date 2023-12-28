FactoryBot.define do
  factory :chat_room, class: 'Chat::Room' do
    sequence :name do |n|
       "MyString#{n}"
    end
    private { false }
  end
end
