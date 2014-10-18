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
  end
  
  def unauthorized
    respond_to do |format|                       # layout: 'layouts/error', 
      format.html { render template: 'errors/error_401', status: 401 }
      format.all  { render nothing: true, status: 401 }
    end
  end

  def unprocessable
    respond_to do |format|                       # layout: 'layouts/error', 
      format.html { render template: 'errors/error_422', status: 422 }
      format.all  { render nothing: true, status: 422 }
    end
  end

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/error_404', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render template: 'errors/error_500', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
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
