module Report
  class ConstituenciesController < BaseController 
    before_action :set_constituency, only: [:show]
    load_and_authorize_resource 

    def show
    end  

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_constituency
        @constituency = Constituency.find(params[:id])
        @valid_votes_sum = @constituency.valid_votes.sum('quantity')
        @invalid_votes_sum = @constituency.invalid_votes.sum('quantity')
      end
    end
    
end