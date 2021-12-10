require "rails_helper"

RSpec.describe "user_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/user_profiles", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "user_profiles",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(UserProfileResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { UserProfile.count }.by(1)
    end
  end
end
