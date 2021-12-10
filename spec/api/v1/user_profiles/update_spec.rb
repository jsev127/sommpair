require "rails_helper"

RSpec.describe "user_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_profiles/#{user_profile.id}", payload
  end

  describe "basic update" do
    let!(:user_profile) { create(:user_profile) }

    let(:payload) do
      {
        data: {
          id: user_profile.id.to_s,
          type: "user_profiles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_profile.reload.attributes }
    end
  end
end
