class WineriesController < ApplicationController
  before_action :set_winery, only: %i[show edit update destroy]

  def index
    @q = Winery.ransack(params[:q])
    @wineries = @q.result(distinct: true).includes(:wines, :region,
                                                   :country).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@wineries.where.not(address_latitude: nil)) do |winery, marker|
      marker.lat winery.address_latitude
      marker.lng winery.address_longitude
    end
  end

  def show
    @wine = Wine.new
  end

  def new
    @winery = Winery.new
  end

  def edit; end

  def create
    @winery = Winery.new(winery_params)

    if @winery.save
      message = "Winery was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @winery, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @winery.update(winery_params)
      redirect_to @winery, notice: "Winery was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @winery.destroy
    message = "Winery was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to wineries_url, notice: message
    end
  end

  private

  def set_winery
    @winery = Winery.find(params[:id])
  end

  def winery_params
    params.require(:winery).permit(:name, :address, :website, :region_id)
  end
end
