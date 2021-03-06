require "rails_helper"

RSpec.describe UserProfile, type: :model do
  describe "Direct Associations" do
    it { should have_many(:reviews) }

    it { should have_many(:bookmarks) }
  end

  describe "InDirect Associations" do
    it { should have_many(:wines_tasted) }
  end

  describe "Validations" do
    it { should validate_presence_of(:username) }
  end
end
