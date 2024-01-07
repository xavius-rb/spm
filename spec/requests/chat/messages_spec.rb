require 'rails_helper'

RSpec.describe "Chat::Messages", type: :request do
  let(:room) { create(:chat_room) }

  describe "GET /new" do
    it "returns http success" do
      get new_chat_room_message_path(room)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      expect {
        post chat_room_messages_path(room), params: { chat_message: { body: 'Hello, World!' } }
      }.to change(Chat::Message, :count).by(1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
