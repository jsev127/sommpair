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
    message = "Winery was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to wineries_url, notice: message
    end
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
