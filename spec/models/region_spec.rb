require "rails_helper"

RSpec.describe Region, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:country) }

    it { should have_many(:wineries) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
