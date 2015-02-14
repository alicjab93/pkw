module Report
class ProvincesController < BaseController

  def index
    current_user.inspect
    @provinces = Province.all
  end  
  
end
end