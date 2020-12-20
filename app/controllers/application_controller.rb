class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters               
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cover]) 
    end
    def redirect_if_not_signed_in
        redirect_to root_path if !user_signed_in?
      end
      
      def redirect_if_signed_in
        redirect_to root_path if user_signed_in?
      end
end
