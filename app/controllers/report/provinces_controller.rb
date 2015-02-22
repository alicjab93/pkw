module Report
  class ProvincesController < BaseController  
    before_action :set_province, only: [:show]
    load_and_authorize_resource

    def index
      @provinces = Province.all
      @constituencies = Constituency.all
      @valid_votes = ValidVote.all
      @invalid_votes = InvalidVote.all
      @committees = Committee.all
    end  

    def show
  #    @committees = @province.committees
    end  

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_province
        @province = Province.find(params[:id])
        @valid_votes_sum = @province.valid_votes.sum('quantity')
        @invalid_votes_sum = @province.invalid_votes.sum('quantity')
      end
    end
    
end