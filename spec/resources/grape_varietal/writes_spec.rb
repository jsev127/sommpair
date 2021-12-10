require 'rails_helper'

RSpec.describe GrapeVarietalResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'grape_varietals',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GrapeVarietalResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { GrapeVarietal.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:grape_varietal) { create(:grape_varietal) }

    let(:payload) do
      {
        data: {
          id: grape_varietal.id.to_s,
          type: 'grape_varietals',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GrapeVarietalResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { grape_varietal.reload.updated_at }
      # .and change { grape_varietal.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:grape_varietal) { create(:grape_varietal) }

    let(:instance) do
      GrapeVarietalResource.find(id: grape_varietal.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { GrapeVarietal.count }.by(-1)
    end
  end
end
