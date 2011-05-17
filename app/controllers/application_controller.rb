class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  def after_sign_out_path_for (resource)
    new_user_session_url
  end
  
  def after_sign_in_path_for (resource)
    companies_url
  end
end
