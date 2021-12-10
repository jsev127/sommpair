require 'rails_helper'

RSpec.describe "grape_varietals#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/grape_varietals/#{grape_varietal.id}", payload
  end

  describe 'basic update' do
    let!(:grape_varietal) { create(:grape_varietal) }

    let(:payload) do
      {
        data: {
          id: grape_varietal.id.to_s,
          type: 'grape_varietals',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GrapeVarietalResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { grape_varietal.reload.attributes }
    end
  end
end
