class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    endusers_items_path
  end
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:name,:first_name,:last_name,:first_furigana,:last_furigana,
    :phone_number,:postal_code,:address])

    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end