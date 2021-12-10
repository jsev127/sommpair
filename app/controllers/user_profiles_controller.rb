class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[show edit update destroy]

  def index
    @user_profiles = UserProfile.page(params[:page]).per(10)
  end

  def show
    @review = Review.new
    @bookmark = Bookmark.new
  end

  def new
    @user_profile = UserProfile.new
  end

  def edit; end

  def create
    @user_profile = UserProfile.new(user_profile_params)

    if @user_profile.save
      redirect_to @user_profile,
                  notice: "User profile was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile,
                  notice: "User profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_profile.destroy
    redirect_to user_profiles_url,
                notice: "User profile was successfully destroyed."
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :username)
  end
end
