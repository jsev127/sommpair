require 'rails_helper'

RSpec.describe "wineries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wineries", params: params
  end

  describe 'basic fetch' do
    let!(:winery1) { create(:winery) }
    let!(:winery2) { create(:winery) }

    it 'works' do
      expect(WineryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['wineries'])
      expect(d.map(&:id)).to match_array([winery1.id, winery2.id])
    end
  end
end
