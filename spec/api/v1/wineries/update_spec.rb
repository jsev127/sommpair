require "rails_helper"

RSpec.describe "wineries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/wineries/#{winery.id}", payload
  end

  describe "basic update" do
    let!(:winery) { create(:winery) }

    let(:payload) do
      {
        data: {
          id: winery.id.to_s,
          type: "wineries",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(WineryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { winery.reload.attributes }
    end
  end
end
