class ApplicationController < ActionController::Base
  # [...]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_back_path
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[
                                        username
                                        email
                                        first_name
                                        last_name
                                        phone_number
                                        street_name
                                        postal_code
                                        location
                                        country
                                      ])
  end

  def store_back_path
    session[:back] ||= []
    session[:back] << request.referer unless request.referer.nil?
    session[:back].reverse.pop if session[:back].size > 2
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || session[:back].first
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
