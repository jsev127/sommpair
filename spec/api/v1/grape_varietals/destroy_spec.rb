require "rails_helper"

RSpec.describe "grape_varietals#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/grape_varietals/#{grape_varietal.id}"
  end

  describe "basic destroy" do
    let!(:grape_varietal) { create(:grape_varietal) }

    it "updates the resource" do
      expect(GrapeVarietalResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { GrapeVarietal.count }.by(-1)
      expect { grape_varietal.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
