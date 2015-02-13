class ConstituenciesController < ApplicationController
  before_action :authenticate_user!   
  before_action :set_constituency, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :constituency
  load_and_authorize_resource :invalid_vote, :through => :constituency
  
  # GET /constituencies
  # GET /constituencies.json
  def index
    @constituencies = Constituency.all
  end

  # GET /constituencies/1
  # GET /constituencies/1.json
  def show
  end

  # GET /constituencies/new
  def new
    @constituency = Constituency.new
  end

  # GET /constituencies/1/edit
  def edit
    
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

  # POST /constituencies
  # POST /constituencies.json
  def create
    @constituency = Constituency.new(constituency_params)

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: 'Constituency was successfully created.' }
        format.json { render :show, status: :created, location: @constituency }
      else
        format.html { render :new }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constituencies/1
  # PATCH/PUT /constituencies/1.json
  def update
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { redirect_to @constituency, notice: 'Constituency was successfully updated.' }
        format.json { render :show, status: :ok, location: @constituency }
      else
        format.html { render :edit }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1
  # DELETE /constituencies/1.json
  def destroy
    @constituency.destroy
    respond_to do |format|
      format.html { redirect_to constituencies_url, notice: 'Constituency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constituency_params
      params.require(:constituency).permit(:number, :mandates, :ballots, :voters, :province_id, 
        valid_votes_attributes: [:id, :quantity, :committee_id], invalid_votes_attributes: [:id, :quantity, :reason_id])
    end  
end
