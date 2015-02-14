class WelcomeController < ApplicationController
  before_action :authenticate_user!
  before_filter :redirect_user
  private
  def redirect_user
#    redirect_to root_url unless current_user.role == "ckw"
#  end    
#  
#  def user_layout
    if current_user.present? && current_user.role == 'admin'
#      "admin"
    elsif current_user.present? && current_user.role == 'okw'
#      "okw"
    elsif current_user.present? && current_user.role == 'ckw'
      redirect_to :controller => 'report/base', :action => 'index'
    end
  end    
  
  def index
  end
end
