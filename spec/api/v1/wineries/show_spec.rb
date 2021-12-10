require 'rails_helper'

RSpec.describe "wineries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wineries/#{winery.id}", params: params
  end

  describe 'basic fetch' do
    let!(:winery) { create(:winery) }

    it 'works' do
      expect(WineryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('wineries')
      expect(d.id).to eq(winery.id)
    end
  end
end
