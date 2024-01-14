class Chat::Room < ApplicationRecord
  after_create_commit { broadcast_append_to "chat_rooms" }
  scope :public_rooms, -> { where(private: false) }

  has_many :messages, class_name: 'Chat::Message', foreign_key: :chat_room_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
