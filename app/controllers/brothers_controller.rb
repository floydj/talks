class BrothersController < ApplicationController
  before_action :set_congregation, only: [ :new, :create, :multiple, :add_multiple ]
  before_action :set_brother, only: [:show, :edit, :update, :destroy]

  def index
    @brothers = Brother.all
  end

  def show
  end

  def new
    @brother = Brother.new
  end

  def edit
  end

  def create
    @brother = @congregation.brothers.new(brother_params)

    respond_to do |format|
      if @brother.save
        format.html { redirect_to @brother.congregation, notice: 'Brother was successfully created.' }
        format.json { render :show, status: :created, location: @brother }
      else
        format.html { render :new }
        format.json { render json: @brother.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @brother.update(brother_params)
        format.html { redirect_to @brother, notice: 'Brother was successfully updated.' }
        format.json { render :show, status: :ok, location: @brother }
      else
        format.html { render :edit }
        format.json { render json: @brother.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brother.destroy
    respond_to do |format|
      format.html { redirect_to brothers_url, notice: 'Brother was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def multiple

  end

  def add_multiple
    if params[:brothers].blank?
      redirect_to brothers_path
      return
    end

    brothers = params[:brothers].gsub! "\r", ''
    brothers = brothers.split "\n"
    brothers.each do |brother|
      @congregation.brothers.create(first_name: brother.split(' ').first,
                                    last_name: brother.split(' ').drop(1).join(' '))
    end

    redirect_to @congregation
  end

  private

  def set_brother
    @brother = Brother.friendly.find(params[:id])
  end

  def set_congregation
    @congregation = Congregation.friendly.find(params[:congregation_id])
  end

  def brother_params
    params.require(:brother).permit(:congregation_id, :first_name,
                                    :last_name, :phone, :email, :outline_ids => [])
  end
end
