class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :admin, :gender, :birth_date)
  end
end