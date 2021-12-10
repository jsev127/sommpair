require 'rails_helper'

RSpec.describe "user_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_profiles/#{user_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:user_profile) { create(:user_profile) }

    it 'works' do
      expect(UserProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('user_profiles')
      expect(d.id).to eq(user_profile.id)
    end
  end
end
