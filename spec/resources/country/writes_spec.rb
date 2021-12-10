require "rails_helper"

RSpec.describe CountryResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "countries",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CountryResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Country.count }.by(1)
    end
  end

  describe "updating" do
    let!(:country) { create(:country) }

    let(:payload) do
      {
        data: {
          id: country.id.to_s,
          type: "countries",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CountryResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { country.reload.updated_at }
      # .and change { country.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:country) { create(:country) }

    let(:instance) do
      CountryResource.find(id: country.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Country.count }.by(-1)
    end
  end
end
