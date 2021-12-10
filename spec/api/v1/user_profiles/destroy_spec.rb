require "rails_helper"

RSpec.describe "user_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_profiles/#{user_profile.id}"
  end

  describe "basic destroy" do
    let!(:user_profile) { create(:user_profile) }

    it "updates the resource" do
      expect(UserProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserProfile.count }.by(-1)
      expect { user_profile.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
