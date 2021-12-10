require 'rails_helper'

RSpec.describe GrapeVarietal, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:wines) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
