class ExtraServicesController < ApplicationController
  before_action :set_extra_service, only: [:show, :edit, :update, :destroy]

  # GET /extra_services
  # GET /extra_services.json
  def index
    @extra_services = ExtraService.all
  end

  # GET /extra_services/1
  # GET /extra_services/1.json
  def show
  end

  # GET /extra_services/new
  def new
    @extra_service = ExtraService.new
  end

  # GET /extra_services/1/edit
  def edit
  end

  # POST /extra_services
  # POST /extra_services.json
  def create
    @extra_service = ExtraService.new(extra_service_params)

    respond_to do |format|
      if @extra_service.save
        format.html { redirect_to @extra_service, notice: 'Extra service was successfully created.' }
        format.json { render :show, status: :created, location: @extra_service }
      else
        format.html { render :new }
        format.json { render json: @extra_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_services/1
  # PATCH/PUT /extra_services/1.json
  def update
    respond_to do |format|
      if @extra_service.update(extra_service_params)
        format.html { redirect_to @extra_service, notice: 'Extra service was successfully updated.' }
        format.json { render :show, status: :ok, location: @extra_service }
      else
        format.html { render :edit }
        format.json { render json: @extra_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_services/1
  # DELETE /extra_services/1.json
  def destroy
    @extra_service.destroy
    respond_to do |format|
      format.html { redirect_to extra_services_url, notice: 'Extra service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_service
      @extra_service = ExtraService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_service_params
      params.require(:extra_service).permit(:reservation_id, :service_id)
    end
end
