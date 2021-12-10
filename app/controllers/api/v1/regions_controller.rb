class Api::V1::RegionsController < Api::V1::GraphitiController
  def index
    regions = RegionResource.all(params)
    respond_with(regions)
  end

  def show
    region = RegionResource.find(params)
    respond_with(region)
  end

  def create
    region = RegionResource.build(params)

    if region.save
      render jsonapi: region, status: :created
    else
      render jsonapi_errors: region
    end
  end

  def update
    region = RegionResource.find(params)

    if region.update_attributes
      render jsonapi: region
    else
      render jsonapi_errors: region
    end
  end

  def destroy
    region = RegionResource.find(params)

    if region.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: region
    end
  end
end
