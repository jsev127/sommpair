require 'rails_helper'

RSpec.describe WineryResource, type: :resource do
  describe 'serialization' do
    let!(:winery) { create(:winery) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(winery.id)
      expect(data.jsonapi_type).to eq('wineries')
    end
  end

  describe 'filtering' do
    let!(:winery1) { create(:winery) }
    let!(:winery2) { create(:winery) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: winery2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([winery2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:winery1) { create(:winery) }
      let!(:winery2) { create(:winery) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            winery1.id,
            winery2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            winery2.id,
            winery1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
