class Api::V1::GrapeVarietalsController < Api::V1::GraphitiController
  def index
    grape_varietals = GrapeVarietalResource.all(params)
    respond_with(grape_varietals)
  end

  def show
    grape_varietal = GrapeVarietalResource.find(params)
    respond_with(grape_varietal)
  end

  def create
    grape_varietal = GrapeVarietalResource.build(params)

    if grape_varietal.save
      render jsonapi: grape_varietal, status: :created
    else
      render jsonapi_errors: grape_varietal
    end
  end

  def update
    grape_varietal = GrapeVarietalResource.find(params)

    if grape_varietal.update_attributes
      render jsonapi: grape_varietal
    else
      render jsonapi_errors: grape_varietal
    end
  end

  def destroy
    grape_varietal = GrapeVarietalResource.find(params)

    if grape_varietal.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: grape_varietal
    end
  end
end
