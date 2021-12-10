require 'rails_helper'

RSpec.describe "grape_varietals#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/grape_varietals/#{grape_varietal.id}", params: params
  end

  describe 'basic fetch' do
    let!(:grape_varietal) { create(:grape_varietal) }

    it 'works' do
      expect(GrapeVarietalResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('grape_varietals')
      expect(d.id).to eq(grape_varietal.id)
    end
  end
end
