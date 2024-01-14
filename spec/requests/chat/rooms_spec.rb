require 'rails_helper'

RSpec.describe "Chat::Rooms", type: :request do
  describe "GET /index" do
    let!(:room) { create(:chat_room) }
    let!(:private_room) { create(:chat_room, :private) }

    it "returns http success" do
      get chat_rooms_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(room.name)
      expect(response.body).not_to include(private_room.name)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      room = create(:chat_room)

      get chat_room_path(room)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(room.name)
    end
  end
end
