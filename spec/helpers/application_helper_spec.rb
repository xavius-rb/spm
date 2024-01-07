require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#active_menu_class" do
    subject { helper.active_menu_class(controller_name) }

    before do
      allow(helper).to receive(:params).and_return({controller: controller_param})
    end

    context "when controller matches" do
      let(:controller_name) { "home" }
      let(:controller_param) { "home" }

      it { is_expected.to eq("is-active") }
    end

    context "when controller does not match" do
      let(:controller_name) { "chat/messages" }
      let(:controller_param) { "home" }

      it { is_expected.to eq("") }
    end
  end
end
