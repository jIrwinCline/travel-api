class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    # binding.pry
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
  def sign_up_params
   params.require(:user).permit(:email, :password, :password_confirmation)
 end
end
