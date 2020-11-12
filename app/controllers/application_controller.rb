class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Hostuser
      hostuser_homes_top_path
    when Enduser
      enduser_items_path
    end
  end

  def after_sign_out_path_for(resource)
    new_hostuser_hostuser_session_path
  end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:first_name,:last_name,:first_furigana,:last_furigana,
    :phone_number,:postal_code,:address,:costomer_status])

    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end