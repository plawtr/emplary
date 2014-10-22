class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  def index
	end

	def terms
	end

  def pricing
  end

  def login
  end

  def results
     # loc=GoogleGeocoder.geocode('e8 4dg')
  end

  def format_errors(error_messages)
    output = []
    error_messages.each {|k, v| output << "#{k.to_s.capitalize} #{v.join(", ")}."}
    output
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

  def ensure_signup_complete
    return if action_name == 'finish_signup'
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
end
