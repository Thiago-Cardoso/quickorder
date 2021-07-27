module DevisePermittedParameter
  extend ActiveSupport::Concern

  protected
  included do
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :occupation, :status) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :occupation, :status) }
    end
  end
end