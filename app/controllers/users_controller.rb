class UsersController < ApplicationController
  def show
    # personnal show only
    @user = policy_scope(User).find(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :email,
      :first_name, :last_name,
      :phone_number, :street_name,
      :postal_code, :location, :country
    )
  end
end
