require "rails_helper"

RSpec.describe "wines#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/wines/#{wine.id}"
  end

  describe "basic destroy" do
    let!(:wine) { create(:wine) }

    it "updates the resource" do
      expect(WineResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Wine.count }.by(-1)
      expect { wine.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
