require "rails_helper"

RSpec.describe "user_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_profiles", params: params
  end

  describe "basic fetch" do
    let!(:user_profile1) { create(:user_profile) }
    let!(:user_profile2) { create(:user_profile) }

    it "works" do
      expect(UserProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_profiles"])
      expect(d.map(&:id)).to match_array([user_profile1.id, user_profile2.id])
    end
  end
end
