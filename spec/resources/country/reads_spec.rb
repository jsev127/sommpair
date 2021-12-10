require 'rails_helper'

RSpec.describe CountryResource, type: :resource do
  describe 'serialization' do
    let!(:country) { create(:country) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(country.id)
      expect(data.jsonapi_type).to eq('countries')
    end
  end

  describe 'filtering' do
    let!(:country1) { create(:country) }
    let!(:country2) { create(:country) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: country2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([country2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:country1) { create(:country) }
      let!(:country2) { create(:country) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            country1.id,
            country2.id
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
            country2.id,
            country1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
