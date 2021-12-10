require 'rails_helper'

RSpec.describe "wines#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wines", params: params
  end

  describe 'basic fetch' do
    let!(:wine1) { create(:wine) }
    let!(:wine2) { create(:wine) }

    it 'works' do
      expect(WineResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['wines'])
      expect(d.map(&:id)).to match_array([wine1.id, wine2.id])
    end
  end
end
