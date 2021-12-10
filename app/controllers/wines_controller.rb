class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  def index
    @wines = Wine.page(params[:page]).per(10)
  end

  # GET /wines/1
  def show
    @review = Review.new
    @bookmark = Bookmark.new
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      message = 'Wine was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @wine, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /wines/1
  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: 'Wine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wines/1
  def destroy
    @wine.destroy
    message = "Wine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to wines_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wine_params
      params.require(:wine).permit(:winery_id, :grape_varietal_id, :vintage, :category_id, :description_id)
    end
end
