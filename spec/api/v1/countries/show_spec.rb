require 'rails_helper'

RSpec.describe "countries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/countries/#{country.id}", params: params
  end

  describe 'basic fetch' do
    let!(:country) { create(:country) }

    it 'works' do
      expect(CountryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('countries')
      expect(d.id).to eq(country.id)
    end
  end
end
