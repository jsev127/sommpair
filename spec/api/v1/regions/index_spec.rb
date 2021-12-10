require 'rails_helper'

RSpec.describe "regions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/regions", params: params
  end

  describe 'basic fetch' do
    let!(:region1) { create(:region) }
    let!(:region2) { create(:region) }

    it 'works' do
      expect(RegionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['regions'])
      expect(d.map(&:id)).to match_array([region1.id, region2.id])
    end
  end
end
