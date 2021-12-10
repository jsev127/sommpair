require "rails_helper"

RSpec.describe "regions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/regions/#{region.id}"
  end

  describe "basic destroy" do
    let!(:region) { create(:region) }

    it "updates the resource" do
      expect(RegionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Region.count }.by(-1)
      expect { region.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
