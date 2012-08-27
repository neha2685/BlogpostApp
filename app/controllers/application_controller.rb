class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || root_path
  end

  private

  def after_sign_out_path_for(resource)
    stored_location_for(:user) || root_path
  end
end
