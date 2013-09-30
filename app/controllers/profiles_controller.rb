class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
  def edit
    @profile = current_user.profile
    @pictures = @profile.pictures
  end
  def update
      @profile = current_user.profile

      respond_to do |format|
        if @profile.update_attributes(params[:profile])
          format.html { redirect_to profile_path(@profile), notice: ' Successfully updated profile.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
  end
end
