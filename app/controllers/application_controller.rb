class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound,    with: :route_not_found
  rescue_from ActionController::RoutingError,  with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :route_not_found
  protect_from_forgery with: :exception
  before_action :require_login
  include SessionsHelper
  include MatchesHelper

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private
  def require_login
    unless logged_in?
      flash.now.alert = 'Você deve estar logado para acessar esta seção!'
      redirect_to login_path, notice: 'Você deve estar logado para acessar esta seção!'
    end
  end
end
