class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private
    def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authentication_redirect
      redirect_to root_path unless logged_in?
    end

    helper_method :current_user

end
