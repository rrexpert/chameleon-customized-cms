class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found
  rescue_from AbstractController::ActionNotFound, with: :on_record_not_found
  rescue_from ActionController::RoutingError, with: :on_routing_error
  rescue_from CanCan::AccessDenied, with: :on_access_denied

  def render_404
    if params[:format].present? && params[:format] != 'html'
      head status: 404
    else
      render 'application/404', status: 404
    end
  end

  def on_access_denied
    if params[:format].present? && params[:format] != 'html'
      head status: 401
    else
      render 'application/401', status: 401
    end
  end

  def on_record_not_found
    render_404
  end

  def on_routing_error
    render_404
  end
end
