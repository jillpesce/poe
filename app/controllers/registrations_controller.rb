class RegistrationsController < Devise::RegistrationsController
    private
  
    def sign_up_params
      params.require(:user).permit( :email,
          :full_name, 
                                    :username, 
                                    :password,
                                    :avatar)
    end
  
    def account_update_params
      params.require(:user).permit( :email,
                                    :current_password)
    end
  end