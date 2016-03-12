class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  if Rails.env.development?
    include Pundit
    # any extra filiter should be aggregated here
    # see https://gist.github.com/vjm/e7d9dbb7603553bfbd2a

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
      if logged_in?
        flash[:danger] = "You don't have permission for this action"
        redirect_to root_path
      else
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_path
      end
    end
  end
end
