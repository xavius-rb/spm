require 'rails_helper'

RSpec.describe Chat::Room, type: :model do
  describe 'scopes' do
    describe '.public_rooms' do
      it 'returns rooms where private is false' do
        room = create(:chat_room, private: false)
        create(:chat_room, private: true)

        expect(Chat::Room.public_rooms).to eq([room])
      end
    end
  end
end
