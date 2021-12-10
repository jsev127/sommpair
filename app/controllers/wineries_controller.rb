class WineriesController < ApplicationController
  before_action :set_winery, only: [:show, :edit, :update, :destroy]

  # GET /wineries
  def index
    @wineries = Winery.all
  end

  # GET /wineries/1
  def show
  end

  # GET /wineries/new
  def new
    @winery = Winery.new
  end

  # GET /wineries/1/edit
  def edit
  end

  # POST /wineries
  def create
    @winery = Winery.new(winery_params)

    if @winery.save
      redirect_to @winery, notice: 'Winery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wineries/1
  def update
    if @winery.update(winery_params)
      redirect_to @winery, notice: 'Winery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wineries/1
  def destroy
    @winery.destroy
    redirect_to wineries_url, notice: 'Winery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winery
      @winery = Winery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def winery_params
      params.require(:winery).permit(:name, :address, :website, :region_id)
    end
end
