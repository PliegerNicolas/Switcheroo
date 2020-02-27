class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user

  end
  def dashboard
    orders = policy_scope(Order)
    @orders = orders.where(renter_id: current_user.id)
    @instruments = current_user.instruments
    @favorites = current_user.favorites
    authorize current_user
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
