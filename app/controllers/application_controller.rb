class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    respond_to do |format|
      format.html do
        render :template => "login/login.html", :layout => "application", :status => :precondition_failed
      end
    end
  end
  end
