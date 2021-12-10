require 'rails_helper'

RSpec.describe Wine, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:grape_varietal) }

    it { should belong_to(:winery) }

    it { should have_many(:reviews) }

    it { should have_many(:bookmarks) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
