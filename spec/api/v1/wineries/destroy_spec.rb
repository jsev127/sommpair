require "rails_helper"

RSpec.describe "wineries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/wineries/#{winery.id}"
  end

  describe "basic destroy" do
    let!(:winery) { create(:winery) }

    it "updates the resource" do
      expect(WineryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Winery.count }.by(-1)
      expect { winery.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
