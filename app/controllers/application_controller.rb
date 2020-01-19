
class ApplicationController < ActionController::Base
  include Authentication
  include Filter
  
  protect_from_forgery
  before_action :authenticate_user
  before_action :set_traffic_style
  before_action :prepare_exception_notifier

  # enforce parameters
  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  # returning false until 1. nginx wants to serve cached files
  # 2. the "stay logged in" cookie is separated from rails session cookie
  # (lobster_trap) which is sent even to logged-out visitors
  CACHE_PAGE = proc { false && @user.blank? && cookies[TAG_FILTER_COOKIE].blank? }

  rescue_from ActionController::UnknownFormat, ActionView::MissingTemplate do
    render plain: '404 Not Found', status: :not_found, content_type: 'text/plain'
  end

end
