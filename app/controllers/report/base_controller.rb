module Report
class Report::BaseController < ApplicationController
  
  before_filter :verify_ckw
  private
  def verify_ckw
    redirect_to root_url unless current_user.role == "ckw"
  end  
  
  def index
    @provinces = Province.all
  end    
end
end