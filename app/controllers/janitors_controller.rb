class JanitorsController < ApplicationController
  before_action :set_janitor, only: [:show, :edit, :update, :destroy]

  # GET /janitors
  # GET /janitors.json
  def index
    @janitors = Janitor.all
  end

  # GET /janitors/1
  # GET /janitors/1.json
  def show
  end

  # GET /janitors/new
  def new
    @janitor = Janitor.new
  end

  # GET /janitors/1/edit
  def edit
  end

  # POST /janitors
  # POST /janitors.json
  def create
    @janitor = Janitor.new(janitor_params)

    respond_to do |format|
      if @janitor.save
        format.html { redirect_to @janitor, notice: 'Janitor was successfully created.' }
        format.json { render :show, status: :created, location: @janitor }
      else
        format.html { render :new }
        format.json { render json: @janitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /janitors/1
  # PATCH/PUT /janitors/1.json
  def update
    respond_to do |format|
      if @janitor.update(janitor_params)
        format.html { redirect_to @janitor, notice: 'Janitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @janitor }
      else
        format.html { render :edit }
        format.json { render json: @janitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /janitors/1
  # DELETE /janitors/1.json
  def destroy
    @janitor.destroy
    respond_to do |format|
      format.html { redirect_to janitors_url, notice: 'Janitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_janitor
      @janitor = Janitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def janitor_params
      params.require(:janitor).permit(:name)
    end
end
