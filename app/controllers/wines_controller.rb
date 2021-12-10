class WinesController < ApplicationController
  before_action :set_wine, only: %i[show edit update destroy]

  def index
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).includes(:bookmarks, :reviews,
                                                :winery, :grape_varietal, :category, :reviewers).page(params[:page]).per(10)
  end

  def show
    @review = Review.new
    @bookmark = Bookmark.new
  end

  def new
    @wine = Wine.new
  end

  def edit; end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      message = "Wine was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @wine, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "Wine was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @wine.destroy
    message = "Wine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to wines_url, notice: message
    end
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:winery_id, :grape_varietal_id, :vintage,
                                 :category_id, :description_id)
  end
end
