require "rails_helper"

RSpec.describe "regions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/regions/#{region.id}", params: params
  end

  describe "basic fetch" do
    let!(:region) { create(:region) }

    it "works" do
      expect(RegionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("regions")
      expect(d.id).to eq(region.id)
    end
  end
end
