require 'rails_helper'

RSpec.describe WineryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'wineries',
          attributes: { }
        }
      }
    end

    let(:instance) do
      WineryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Winery.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:winery) { create(:winery) }

    let(:payload) do
      {
        data: {
          id: winery.id.to_s,
          type: 'wineries',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WineryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { winery.reload.updated_at }
      # .and change { winery.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:winery) { create(:winery) }

    let(:instance) do
      WineryResource.find(id: winery.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Winery.count }.by(-1)
    end
  end
end
