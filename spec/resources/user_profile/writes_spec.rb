require "rails_helper"

RSpec.describe UserProfileResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_profiles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserProfileResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserProfile.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_profile) { create(:user_profile) }

    let(:payload) do
      {
        data: {
          id: user_profile.id.to_s,
          type: "user_profiles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserProfileResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_profile.reload.updated_at }
      # .and change { user_profile.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_profile) { create(:user_profile) }

    let(:instance) do
      UserProfileResource.find(id: user_profile.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserProfile.count }.by(-1)
    end
  end
end
