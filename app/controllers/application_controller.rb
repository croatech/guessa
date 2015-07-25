class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token

  def current_user
    @user = User.find_by_session_key(session[:session_key]) if session[:session_key].present?
  end

  def check_exists_key(session_key)
  	(session_key && User.find_by_session_key(session_key)).present?
  end
end
