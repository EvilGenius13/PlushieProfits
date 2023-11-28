class ApplicationController < ActionController::Base
  helper_method :current_user

  def authenticate_user!
    redirect_to '/' unless session[:userinfo].present?
  end

  private

  def current_user
    return unless session[:userinfo].present?

    @current_user ||= User.find_by(auth_id: session[:userinfo]['sub'])
  end
end
