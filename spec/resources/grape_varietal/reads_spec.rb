require "rails_helper"

RSpec.describe GrapeVarietalResource, type: :resource do
  describe "serialization" do
    let!(:grape_varietal) { create(:grape_varietal) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(grape_varietal.id)
      expect(data.jsonapi_type).to eq("grape_varietals")
    end
  end

  describe "filtering" do
    let!(:grape_varietal1) { create(:grape_varietal) }
    let!(:grape_varietal2) { create(:grape_varietal) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: grape_varietal2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([grape_varietal2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:grape_varietal1) { create(:grape_varietal) }
      let!(:grape_varietal2) { create(:grape_varietal) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      grape_varietal1.id,
                                      grape_varietal2.id,
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
                                      grape_varietal2.id,
                                      grape_varietal1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
