class ApplicationController < ActionController::Base
  before_action :configure_pemitted_parameters, if: :devise_controller?


  protected
  def configure_pemitted_parameters

    #新規登録時にnameを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    #アカウント編集時にnameを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end 

end
