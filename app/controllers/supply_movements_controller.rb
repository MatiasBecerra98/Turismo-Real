class SupplyMovementsController < ApplicationController
  before_action :set_supply_movement, only: [:show, :edit, :update, :destroy]

  # GET /supply_movements
  # GET /supply_movements.json
  def index
    @supply_movements = SupplyMovement.all
  end

  # GET /supply_movements/1
  # GET /supply_movements/1.json
  def show
  end

  # GET /supply_movements/new
  def new
    @supply_movement = SupplyMovement.new
  end

  # GET /supply_movements/1/edit
  def edit
  end

  # POST /supply_movements
  # POST /supply_movements.json
  def create
    @supply_movement = SupplyMovement.new(supply_movement_params)

    respond_to do |format|
      if @supply_movement.save
        format.html { redirect_to @supply_movement, notice: 'Supply movement was successfully created.' }
        format.json { render :show, status: :created, location: @supply_movement }
      else
        format.html { render :new }
        format.json { render json: @supply_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_movements/1
  # PATCH/PUT /supply_movements/1.json
  def update
    respond_to do |format|
      if @supply_movement.update(supply_movement_params)
        format.html { redirect_to @supply_movement, notice: 'Supply movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply_movement }
      else
        format.html { render :edit }
        format.json { render json: @supply_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_movements/1
  # DELETE /supply_movements/1.json
  def destroy
    @supply_movement.destroy
    respond_to do |format|
      format.html { redirect_to supply_movements_url, notice: 'Supply movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_movement
      @supply_movement = SupplyMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_movement_params
      params.require(:supply_movement).permit(:supply_id, :appartment_id, :movement)
    end
end
