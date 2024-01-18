require 'rails_helper'

RSpec.describe EventsReport do
  describe '#generate' do
    events = %w(PURCHASE VIEW_PRODUCT ADD_TO_CART PURCHASE REMOVE_FROM_CART ADD_TO_CART VIEW_PRODUCT PURCHASE ADD_TO_CART PURCHASE)
    report = EventsReport.new(events)

    it do
      result = report.generate
      expect(result.size).to eq 2
      expect(result["0"]).to eq(["PURCHASE", "VIEW_PRODUCT", "ADD_TO_CART", "PURCHASE"])
      expect(result["1"]).to eq(%w(ADD_TO_CART VIEW_PRODUCT PURCHASE ADD_TO_CART PURCHASE))
    end
  end
end