class CongregationsController < ApplicationController
  before_action :set_congregation, only: [:show, :edit, :update, :destroy,
                                          :speaker_list]

  def add_multiple
    if params[:congregations].blank?
      redirect_to congregations_path
      return
    end

    congregations = params[:congregations].delete("\r", '').split("\n")
    congregations.each do |cong|
      Congregation.create(name: cong,
                          meeting_time: '10:00 AM',
                          meeting_day: 'Sunday')
    end

    redirect_to congregations_path
  end

  def multiple
  end

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
    if @congregation.save
      redirect_to congregations_url,
                  notice: 'Congregation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @congregation.update(congregation_params)
      redirect_to congregations_url,
                  notice: 'Congregation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @congregation.destroy
    respond_to do |format|
      format.html do
        redirect_to congregations_url, notice: 'Congregation was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def speaker_list
  end

  private

  def set_congregation
    @congregation = Congregation.friendly.find(params[:id])
  end

  def congregation_params
    params.require(:congregation).permit(:name, :number, :meeting_time, :address,
                                         :meeting_day, :kh_address, :kh_phone,
                                         :talk_coordinator_phone,
                                         :talk_coordinator,
                                         :city, :state, :zip, :my_congregation)
  end
end
