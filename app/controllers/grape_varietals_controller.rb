class GrapeVarietalsController < ApplicationController
  before_action :set_grape_varietal, only: [:show, :edit, :update, :destroy]

  # GET /grape_varietals
  def index
    @grape_varietals = GrapeVarietal.all
  end

  # GET /grape_varietals/1
  def show
    @wine = Wine.new
  end

  # GET /grape_varietals/new
  def new
    @grape_varietal = GrapeVarietal.new
  end

  # GET /grape_varietals/1/edit
  def edit
  end

  # POST /grape_varietals
  def create
    @grape_varietal = GrapeVarietal.new(grape_varietal_params)

    if @grape_varietal.save
      redirect_to @grape_varietal, notice: 'Grape varietal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grape_varietals/1
  def update
    if @grape_varietal.update(grape_varietal_params)
      redirect_to @grape_varietal, notice: 'Grape varietal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grape_varietals/1
  def destroy
    @grape_varietal.destroy
    redirect_to grape_varietals_url, notice: 'Grape varietal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grape_varietal
      @grape_varietal = GrapeVarietal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grape_varietal_params
      params.require(:grape_varietal).permit(:name)
    end
end
