require 'rails_helper'

RSpec.describe "wines#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wines/#{wine.id}", params: params
  end

  describe 'basic fetch' do
    let!(:wine) { create(:wine) }

    it 'works' do
      expect(WineResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('wines')
      expect(d.id).to eq(wine.id)
    end
  end
end
