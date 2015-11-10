#
class ProfilesController < OpenReadController
  before_action :set_profile, only: [:update, :destroy]

  def index
    render json: Profile.all
  end

  def show
    render json: Profile.find(params[:id])
  end

  def create
    profile = Profile.create(profile_params)
    # movie points to an object if create was successfully, else movie points to false
    if profile.save
      render json: profile, status: :created
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update_attributes(profile_params)
      render json: profile, status: :updated
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Profile.find(params[:id]).destroy
    head :ok
  end

  def set_profile
    @profile = current_user.profiles.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :comment,
      :user_id)
  end

  private :set_profile, :profile_params
end
