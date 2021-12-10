require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:wine) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
