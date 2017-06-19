class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def user_authorized
      redirect_to :root unless session[:user_id]
    end

    helper_method :user_authorized

    def user_logged_in
      redirect_to shoes_path if session[:user_id]
    end

    def update_authorization
      event=Event.find(params[:id])
      if current_user!=event.user
        redirect_to shoes_path
      end
    end
    helper_method :update_authorization


end
