require "rails_helper"

RSpec.describe UserProfileResource, type: :resource do
  describe "serialization" do
    let!(:user_profile) { create(:user_profile) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_profile.id)
      expect(data.jsonapi_type).to eq("user_profiles")
    end
  end

  describe "filtering" do
    let!(:user_profile1) { create(:user_profile) }
    let!(:user_profile2) { create(:user_profile) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_profile2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_profile2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_profile1) { create(:user_profile) }
      let!(:user_profile2) { create(:user_profile) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_profile1.id,
                                      user_profile2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_profile2.id,
                                      user_profile1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
