class CongregationsController < ApplicationController
  before_action :set_congregation, only: [:show, :edit, :update, :destroy]

  def index
    @congregations = Congregation.order(:name)
  end

  def show
  end

  def new
    @congregation = Congregation.new
  end

  def edit
  end

  def create
    @congregation = Congregation.new(congregation_params)

    respond_to do |format|
      if @congregation.save
        format.html { redirect_to congregations_url, notice: 'Congregation was successfully created.' }
        format.json { render :show, status: :created, location: @congregation }
      else
        format.html { render :new }
        format.json { render json: @congregation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @congregation.update(congregation_params)
        format.html { redirect_to congregations_url, notice: 'Congregation was successfully updated.' }
        format.json { render :show, status: :ok, location: @congregation }
      else
        format.html { render :edit }
        format.json { render json: @congregation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @congregation.destroy
    respond_to do |format|
      format.html { redirect_to congregations_url, notice: 'Congregation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congregation
      @congregation = Congregation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congregation_params
      params.require(:congregation).permit(:name, :number, :meeting_time,
                                           :meeting_day, :kh_address, :kh_phone,
                                          :talk_coordinator_phone, :talk_coordinator,
                                          :city, :state, :zip)
    end
end
