class ApplicationController < ActionController::Base
  before_action :configure_pemitted_parameters, if: :devise_controller?


  protected

  def configure_pemitted_parameters

    #新規登録時にnameを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    #アカウント編集時にnameを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end 

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    elsif resource.is_a?(User)
      mypage_path
    else 
      root_path 
    end 
  end 
end
