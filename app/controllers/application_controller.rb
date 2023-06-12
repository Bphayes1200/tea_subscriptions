class ApplicationController < ActionController::API
  rescue_from  ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  private

  def record_invalid(error)
    render json: { errors: error}, status: 404
  end

  def render_not_found(error)
    render json: { errors: error }, status: 404
  end
end
