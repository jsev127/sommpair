class CountriesController < ApplicationController
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @q = Country.ransack(params[:q])
    @countries = @q.result(distinct: true).includes(:regions,
                                                    :wineries).page(params[:page]).per(10)
  end

  def show
    @region = Region.new
  end

  def new
    @country = Country.new
  end

  def edit; end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to @country, notice: "Country was successfully created."
    else
      render :new
    end
  end

  def update
    if @country.update(country_params)
      redirect_to @country, notice: "Country was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url, notice: "Country was successfully destroyed."
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
