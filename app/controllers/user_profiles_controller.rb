class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[show edit update destroy]

  # GET /user_profiles
  def index
    @user_profiles = UserProfile.page(params[:page]).per(10)
  end

  # GET /user_profiles/1
  def show
    @review = Review.new
    @bookmark = Bookmark.new
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit; end

  # POST /user_profiles
  def create
    @user_profile = UserProfile.new(user_profile_params)

    if @user_profile.save
      redirect_to @user_profile,
                  notice: "User profile was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /user_profiles/1
  def update
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile,
                  notice: "User profile was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /user_profiles/1
  def destroy
    @user_profile.destroy
    redirect_to user_profiles_url,
                notice: "User profile was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :username)
  end
end
