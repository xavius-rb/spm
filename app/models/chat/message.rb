class Chat::Message < ApplicationRecord
  belongs_to :room, class_name: 'Chat::Room', foreign_key: :chat_room_id

  after_create_commit -> { broadcast_append_to room, :messages, target: "messages" }
end
