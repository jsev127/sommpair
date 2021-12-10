require 'rails_helper'

RSpec.describe "wines#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/wines/#{wine.id}", payload
  end

  describe 'basic update' do
    let!(:wine) { create(:wine) }

    let(:payload) do
      {
        data: {
          id: wine.id.to_s,
          type: 'wines',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(WineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { wine.reload.attributes }
    end
  end
end
