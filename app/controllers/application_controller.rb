class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
  end
  include Response
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
  def render_resource(resource)
  if resource.errors.empty?
    render json: resource
  else
    validation_error(resource)
  end
end

def validation_error(resource)
  render json: {
    errors: [
      {
        status: '400',
        title: 'Bad Request',
        detail: resource.errors,
        code: '100'
      }
    ]
  }, status: :bad_request
end

end
