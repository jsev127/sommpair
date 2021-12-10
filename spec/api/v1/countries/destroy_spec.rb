require "rails_helper"

RSpec.describe "countries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/countries/#{country.id}"
  end

  describe "basic destroy" do
    let!(:country) { create(:country) }

    it "updates the resource" do
      expect(CountryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Country.count }.by(-1)
      expect { country.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
