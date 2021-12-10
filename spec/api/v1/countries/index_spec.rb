require "rails_helper"

RSpec.describe "countries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/countries", params: params
  end

  describe "basic fetch" do
    let!(:country1) { create(:country) }
    let!(:country2) { create(:country) }

    it "works" do
      expect(CountryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["countries"])
      expect(d.map(&:id)).to match_array([country1.id, country2.id])
    end
  end
end
