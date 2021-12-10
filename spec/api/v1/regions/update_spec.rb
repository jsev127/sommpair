require 'rails_helper'

RSpec.describe "regions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/regions/#{region.id}", payload
  end

  describe 'basic update' do
    let!(:region) { create(:region) }

    let(:payload) do
      {
        data: {
          id: region.id.to_s,
          type: 'regions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RegionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { region.reload.attributes }
    end
  end
end
