require 'rails_helper'

RSpec.describe Project, type: :model do
  #it { should validate_presence_of(:name) }
  #it { should validate_presence_of(:details) }
  #it { should validate_uniqueness_of(:code) }
  #it { should validate_length_of(:name).is_at_least(3) }
  #it { should validate_length_of(:details).is_at_least(5) }
  #it { should have_many(:tasks).dependent(:destroy) }

  describe "callbacks" do
    it "should generate a code on create" do
      project = build(:project, name: "Hellway")
      project.save
      expect(project.code).to_not be_nil
      expect(project.code).to include("HE")
    end
  end
end
