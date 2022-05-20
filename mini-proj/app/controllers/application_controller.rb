class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404 

  def render_404 
    render 'shared/error_404', status: 404
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  def logged_in_user 
    unless user_signed_in? 
      flash[:danger] = "Please log in"
      redirect_to login_path
    end
  end

  def admin_user 
    redirect_to(root_url) unless (user_signed_in? and current_user.admin?)
  end

  def current_user?(user)
    user == current_user
  end
end
