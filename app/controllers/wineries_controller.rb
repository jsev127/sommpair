class WineriesController < ApplicationController
  before_action :set_winery, only: %i[show edit update destroy]

  # GET /wineries
  def index
    @q = Winery.ransack(params[:q])
    @wineries = @q.result(distinct: true).includes(:wines,
                                                   :region).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@wineries.where.not(address_latitude: nil)) do |winery, marker|
      marker.lat winery.address_latitude
      marker.lng winery.address_longitude
      marker.infowindow "<h5><a href='/wineries/#{winery.id}'>#{winery.name}</a></h5><small>#{winery.address_formatted_address}</small>"
    end
  end

  # GET /wineries/1
  def show
    @wine = Wine.new
  end

  # GET /wineries/new
  def new
    @winery = Winery.new
  end

  # GET /wineries/1/edit
  def edit; end

  # POST /wineries
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

  # PATCH/PUT /wineries/1
  def update
    if @winery.update(winery_params)
      redirect_to @winery, notice: "Winery was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /wineries/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_winery
    @winery = Winery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def winery_params
    params.require(:winery).permit(:name, :address, :website, :region_id)
  end
end
