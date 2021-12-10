class Api::V1::CountriesController < Api::V1::GraphitiController
  def index
    countries = CountryResource.all(params)
    respond_with(countries)
  end

  def show
    country = CountryResource.find(params)
    respond_with(country)
  end

  def create
    country = CountryResource.build(params)

    if country.save
      render jsonapi: country, status: 201
    else
      render jsonapi_errors: country
    end
  end

  def update
    country = CountryResource.find(params)

    if country.update_attributes
      render jsonapi: country
    else
      render jsonapi_errors: country
    end
  end

  def destroy
    country = CountryResource.find(params)

    if country.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: country
    end
  end
end
