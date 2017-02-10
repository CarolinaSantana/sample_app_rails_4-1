class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  Rails.application.routes.default_url_options[:port] = 8080
  protect_from_forgery with: :exception
  include SessionsHelper
end
