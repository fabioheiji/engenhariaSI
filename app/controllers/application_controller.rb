class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound,    with: :route_not_found
  rescue_from ActionController::RoutingError,  with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :route_not_found
  protect_from_forgery with: :exception
  include SessionsHelper


  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
