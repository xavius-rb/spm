require 'rails_helper'

RSpec.describe EventsReport do
  describe '#generate' do
    let(:result) { described_class.new(events).generate }
    let(:events) do
      %w(PURCHASE VIEW_PRODUCT ADD_TO_CART PURCHASE REMOVE_FROM_CART ADD_TO_CART VIEW_PRODUCT PURCHASE ADD_TO_CART PURCHASE)
    end

    it do
      expect(result.size).to eq 2
      expect(result["0"]).to eq(["PURCHASE", "VIEW_PRODUCT", "ADD_TO_CART", "PURCHASE"])
      expect(result["1"]).to eq(%w(ADD_TO_CART VIEW_PRODUCT PURCHASE))
    end

    context "interrupted journey" do
      let(:events) do
        %w(PURCHASE VIEW_PRODUCT ADD_TO_CART LOGOUT PURCHASE REMOVE_FROM_CART ADD_TO_CART VIEW_PRODUCT PURCHASE ADD_TO_CART PURCHASE)
      end

      it do
        expect(result.size).to eq 1
        expect(result["0"]).to eq(%w(ADD_TO_CART VIEW_PRODUCT PURCHASE))
      end
    end
  end
end