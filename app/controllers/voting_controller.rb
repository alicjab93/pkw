class VotingController < ApplicationController
  before_action :authenticate_user!   
  before_action :set_constituency, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :constituency
  load_and_authorize_resource :invalid_vote, :through => :constituency
  load_and_authorize_resource :valid_vote, :through => :constituency
    
  before_filter :verify_okw

  def edit
    if(@constituency.present?)
      # invalid votes per committee
      @constituency.committees.each do |committee|
        unless @constituency.valid_votes.find_by_committee_id committee.id
          @constituency.valid_votes.build("committee_id" => committee.id)
        end      
      end

      # invalid votes per reason
      @reasons = Reason.all
      @reasons.each do |reason|
        unless @constituency.invalid_votes.find_by_reason_id reason.id
          @constituency.invalid_votes.build("reason_id" => reason.id)
        end      
      end
    end
  end  

  def update
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { 
          flash[:notice] = 'Głosy zostały zapisane.'
          redirect_to :controller => 'voting', :action => 'edit' }
        format.json { render :edit, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def verify_okw
      redirect_to root_url unless current_user.role == "okw"
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find_by_id(current_user.constituency_id)
#      @constituency = Constituency.find_by_user_id(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constituency_params
      params.require(:constituency).permit(:ballots, valid_votes_attributes: [:id, :quantity, :committee_id], invalid_votes_attributes: [:id, :quantity, :reason_id])
    end    
  

end
