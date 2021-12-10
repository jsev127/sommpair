class Api::V1::WineriesController < Api::V1::GraphitiController
  def index
    wineries = WineryResource.all(params)
    respond_with(wineries)
  end

  def show
    winery = WineryResource.find(params)
    respond_with(winery)
  end

  def create
    winery = WineryResource.build(params)

    if winery.save
      render jsonapi: winery, status: :created
    else
      render jsonapi_errors: winery
    end
  end

  def update
    winery = WineryResource.find(params)

    if winery.update_attributes
      render jsonapi: winery
    else
      render jsonapi_errors: winery
    end
  end

  def destroy
    winery = WineryResource.find(params)

    if winery.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: winery
    end
  end
end
