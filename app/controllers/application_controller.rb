class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_customers_path
    else
      public_plants_path
    end
  end
  
  def after_sign_out_path_for(resource)
    pp resource
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
end