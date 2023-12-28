require 'rails_helper'

RSpec.describe "Chat::Rooms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get chat_rooms_path
      expect(response).to have_http_status(:success)
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
