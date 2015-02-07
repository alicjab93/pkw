class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  layout :user_layout
  
  protected

  def user_layout
    if current_user.present? && current_user.role == 'admin'
      "admin"
    elsif current_user.present? && current_user.role == 'ckw'
      "ckw"
    elsif current_user.present? && current_user.role == 'okw'
      "okw"
    else
      "application"
    end
  end  
  
end
