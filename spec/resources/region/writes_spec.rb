require 'rails_helper'

RSpec.describe RegionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'regions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RegionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Region.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:region) { create(:region) }

    let(:payload) do
      {
        data: {
          id: region.id.to_s,
          type: 'regions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RegionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { region.reload.updated_at }
      # .and change { region.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:region) { create(:region) }

    let(:instance) do
      RegionResource.find(id: region.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Region.count }.by(-1)
    end
  end
end
