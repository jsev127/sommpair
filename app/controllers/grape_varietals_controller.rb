class GrapeVarietalsController < ApplicationController
  before_action :set_grape_varietal, only: %i[show edit update destroy]

  def index
    @q = GrapeVarietal.ransack(params[:q])
    @grape_varietals = @q.result(distinct: true).includes(:wines).page(params[:page]).per(10)
  end

  def show
    @wine = Wine.new
  end

  def new
    @grape_varietal = GrapeVarietal.new
  end

  def edit; end

  def create
    @grape_varietal = GrapeVarietal.new(grape_varietal_params)

    if @grape_varietal.save
      redirect_to @grape_varietal,
                  notice: "Grape varietal was successfully created."
    else
      render :new
    end
  end

  def update
    if @grape_varietal.update(grape_varietal_params)
      redirect_to @grape_varietal,
                  notice: "Grape varietal was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @grape_varietal.destroy
    redirect_to grape_varietals_url,
                notice: "Grape varietal was successfully destroyed."
  end

  private

  def set_grape_varietal
    @grape_varietal = GrapeVarietal.find(params[:id])
  end

  def grape_varietal_params
    params.require(:grape_varietal).permit(:name)
  end
end
