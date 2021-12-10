require "rails_helper"

RSpec.describe RegionResource, type: :resource do
  describe "serialization" do
    let!(:region) { create(:region) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(region.id)
      expect(data.jsonapi_type).to eq("regions")
    end
  end

  describe "filtering" do
    let!(:region1) { create(:region) }
    let!(:region2) { create(:region) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: region2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([region2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:region1) { create(:region) }
      let!(:region2) { create(:region) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      region1.id,
                                      region2.id,
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
                                      region2.id,
                                      region1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
