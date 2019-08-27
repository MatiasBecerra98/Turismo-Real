class AppartmentQualitiesController < ApplicationController
  before_action :set_appartment_quality, only: [:show, :edit, :update, :destroy]

  # GET /appartment_qualities
  # GET /appartment_qualities.json
  def index
    @appartment_qualities = AppartmentQuality.all
  end

  # GET /appartment_qualities/1
  # GET /appartment_qualities/1.json
  def show
  end

  # GET /appartment_qualities/new
  def new
    @appartment_quality = AppartmentQuality.new
  end

  # GET /appartment_qualities/1/edit
  def edit
  end

  # POST /appartment_qualities
  # POST /appartment_qualities.json
  def create
    @appartment_quality = AppartmentQuality.new(appartment_quality_params)

    respond_to do |format|
      if @appartment_quality.save
        format.html { redirect_to @appartment_quality, notice: 'Appartment quality was successfully created.' }
        format.json { render :show, status: :created, location: @appartment_quality }
      else
        format.html { render :new }
        format.json { render json: @appartment_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appartment_qualities/1
  # PATCH/PUT /appartment_qualities/1.json
  def update
    respond_to do |format|
      if @appartment_quality.update(appartment_quality_params)
        format.html { redirect_to @appartment_quality, notice: 'Appartment quality was successfully updated.' }
        format.json { render :show, status: :ok, location: @appartment_quality }
      else
        format.html { render :edit }
        format.json { render json: @appartment_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appartment_qualities/1
  # DELETE /appartment_qualities/1.json
  def destroy
    @appartment_quality.destroy
    respond_to do |format|
      format.html { redirect_to appartment_qualities_url, notice: 'Appartment quality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appartment_quality
      @appartment_quality = AppartmentQuality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appartment_quality_params
      params.require(:appartment_quality).permit(:appartment_id, :cable, :conditioned_air, :internet, :calefaction)
    end
end
