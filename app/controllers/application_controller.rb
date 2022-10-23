class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound,    with: :route_not_found
  rescue_from ActionController::RoutingError,  with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :route_not_found
  protect_from_forgery with: :exception
  before_action :require_login
  include SessionsHelper

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private
  def require_login
    unless logged_in?
      flash.now.alert = 'You must be logged in to access this section'
      redirect_to login_path, notice: 'You must be logged in to access this section'
    end
  end
end
