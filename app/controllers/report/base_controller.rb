module Report
class Report::BaseController < ApplicationController
  
  before_filter :verify_ckw
  private
  def verify_ckw
    redirect_to root_url unless current_user.role == "ckw"
  end  
  
  def index
    redirect_to root_url
  end    
end
end