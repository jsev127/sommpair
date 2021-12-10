class Api::V1::UserProfilesController < Api::V1::GraphitiController
  def index
    user_profiles = UserProfileResource.all(params)
    respond_with(user_profiles)
  end

  def show
    user_profile = UserProfileResource.find(params)
    respond_with(user_profile)
  end

  def create
    user_profile = UserProfileResource.build(params)

    if user_profile.save
      render jsonapi: user_profile, status: 201
    else
      render jsonapi_errors: user_profile
    end
  end

  def update
    user_profile = UserProfileResource.find(params)

    if user_profile.update_attributes
      render jsonapi: user_profile
    else
      render jsonapi_errors: user_profile
    end
  end

  def destroy
    user_profile = UserProfileResource.find(params)

    if user_profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: user_profile
    end
  end
end
