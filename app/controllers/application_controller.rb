class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception

  helper_method :mailbox, :conversation


  
  private

  def conversation
     @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:full_name, :password_confirmation]
      devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
    end

end
