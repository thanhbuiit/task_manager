class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :current_email
  before_action :get_locale
  

  private

  def get_locale
    if session[:locale].nil?
      set_locale
    else
      I18n.locale = session[:locale]
    end
  end

  def set_locale
    I18n.default_locale = :vi
    I18n.locale = params[:locale] || I18n.default_locale 
    session[:locale] = I18n.locale
  end

  def current_email
    if session[:email].nil?
    	redirect_to users_url
    else
    	redirect_to '/home' 
    end
    #@_current_email ||= session[:email] &&
      #User.find_by(email: session[:email])
   #    p "dsdas"
  end	
end
