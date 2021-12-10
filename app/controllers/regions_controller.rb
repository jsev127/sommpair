class RegionsController < ApplicationController
  before_action :set_region, only: %i[show edit update destroy]

  def index
    @q = Region.ransack(params[:q])
    @regions = @q.result(distinct: true).includes(:wineries,
                                                  :country).page(params[:page]).per(10)
  end

  def show
    @winery = Winery.new
  end

  def new
    @region = Region.new
  end

  def edit; end

  def create
    @region = Region.new(region_params)

    if @region.save
      message = "Region was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @region, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @region.update(region_params)
      redirect_to @region, notice: "Region was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @region.destroy
    message = "Region was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to regions_url, notice: message
    end
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :country_id)
  end
end
