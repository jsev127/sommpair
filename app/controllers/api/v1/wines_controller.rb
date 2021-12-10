class Api::V1::WinesController < Api::V1::GraphitiController
  def index
    wines = WineResource.all(params)
    respond_with(wines)
  end

  def show
    wine = WineResource.find(params)
    respond_with(wine)
  end

  def create
    wine = WineResource.build(params)

    if wine.save
      render jsonapi: wine, status: 201
    else
      render jsonapi_errors: wine
    end
  end

  def update
    wine = WineResource.find(params)

    if wine.update_attributes
      render jsonapi: wine
    else
      render jsonapi_errors: wine
    end
  end

  def destroy
    wine = WineResource.find(params)

    if wine.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: wine
    end
  end
end
