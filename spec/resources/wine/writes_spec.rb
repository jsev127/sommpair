require "rails_helper"

RSpec.describe WineResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "wines",
          attributes: {},
        },
      }
    end

    let(:instance) do
      WineResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Wine.count }.by(1)
    end
  end

  describe "updating" do
    let!(:wine) { create(:wine) }

    let(:payload) do
      {
        data: {
          id: wine.id.to_s,
          type: "wines",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      WineResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { wine.reload.updated_at }
      # .and change { wine.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:wine) { create(:wine) }

    let(:instance) do
      WineResource.find(id: wine.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Wine.count }.by(-1)
    end
  end
end
