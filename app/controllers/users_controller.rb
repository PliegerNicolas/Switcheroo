class UsersController < ApplicationController
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def profil
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

  def user_not_authorized
    redirect_to(request.referrer || user_path(@user.id))
  end
end
