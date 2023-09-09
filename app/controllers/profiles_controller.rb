class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @profile = current_user.profile
  end

  def edit
    # if current_user.profile.present?
    #   @profile = current_user.profile
    # else
    #   @profile = current_user.build_profile
    # end
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end

  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender
    )
  end

end
