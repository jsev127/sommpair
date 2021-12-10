require "rails_helper"

RSpec.describe WineResource, type: :resource do
  describe "serialization" do
    let!(:wine) { create(:wine) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(wine.id)
      expect(data.jsonapi_type).to eq("wines")
    end
  end

  describe "filtering" do
    let!(:wine1) { create(:wine) }
    let!(:wine2) { create(:wine) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: wine2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([wine2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:wine1) { create(:wine) }
      let!(:wine2) { create(:wine) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      wine1.id,
                                      wine2.id,
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
                                      wine2.id,
                                      wine1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
