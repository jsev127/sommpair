require "rails_helper"

RSpec.describe "grape_varietals#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/grape_varietals", params: params
  end

  describe "basic fetch" do
    let!(:grape_varietal1) { create(:grape_varietal) }
    let!(:grape_varietal2) { create(:grape_varietal) }

    it "works" do
      expect(GrapeVarietalResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["grape_varietals"])
      expect(d.map(&:id)).to match_array([grape_varietal1.id,
                                          grape_varietal2.id])
    end
  end
end
