class CleaningEventsController < ApplicationController
  before_action :set_cleaning_event, only: [:show, :edit, :update, :destroy]

  # GET /cleaning_events
  # GET /cleaning_events.json
  def index
    @cleaning_events = CleaningEvent.all
  end

  # GET /cleaning_events/1
  # GET /cleaning_events/1.json
  def show
  end

  # GET /cleaning_events/new
  def new
    @cleaning_event = CleaningEvent.new
  end

  # GET /cleaning_events/1/edit
  def edit
  end

  # POST /cleaning_events
  # POST /cleaning_events.json
  def create
    @cleaning_event = CleaningEvent.new(cleaning_event_params)

    respond_to do |format|
      if @cleaning_event.save
        format.html { redirect_to @cleaning_event, notice: 'Cleaning event was successfully created.' }
        format.json { render :show, status: :created, location: @cleaning_event }
      else
        format.html { render :new }
        format.json { render json: @cleaning_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cleaning_events/1
  # PATCH/PUT /cleaning_events/1.json
  def update
    respond_to do |format|
      if @cleaning_event.update(cleaning_event_params)
        format.html { redirect_to @cleaning_event, notice: 'Cleaning event was successfully updated.' }
        format.json { render :show, status: :ok, location: @cleaning_event }
      else
        format.html { render :edit }
        format.json { render json: @cleaning_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cleaning_events/1
  # DELETE /cleaning_events/1.json
  def destroy
    @cleaning_event.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_events_url, notice: 'Cleaning event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cleaning_event
      @cleaning_event = CleaningEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cleaning_event_params
      params.require(:cleaning_event).permit(:appartment_id, :time_of_event, :janitor_id, :reminder_sent)
    end
end
