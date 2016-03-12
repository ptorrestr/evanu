module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    # Add general filters for all resources
    # See https://gist.github.com/vjm/e7d9dbb7603553bfbd2a

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

ApplicationController.send :include, PunditHelper unless Rails.env.development?
