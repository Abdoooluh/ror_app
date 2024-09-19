class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_or_vendor!  


  def new
    super
  end

  def create
    super
  end

  # Add any additional methods you need
  private

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :cell_number, :password, :password_confirmation, :city_id)
  end
end
