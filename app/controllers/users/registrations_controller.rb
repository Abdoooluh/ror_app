class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_or_vendor!
  def create
    super do |user|
      # Default role to customer
      user.role = Role.find_by(name: "Customer") unless user.role
      user.save
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :cell_number, :password, :password_confirmation, :city_id, :role_id)
  end
end
