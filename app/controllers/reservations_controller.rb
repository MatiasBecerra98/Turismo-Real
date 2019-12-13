class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  def pdf_invoice
    @reservation = Reservation.find(params[:id])

    pdf_string = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: "Reservation #{@reservation.id}",
        page_size: 'A4',
        template: "reservations/pdf_invoice.html.erb",
        layout: nil,
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75,
        encoding: 'utf8'
      )
    )

    tempfile = Tempfile.new(["Reservation #{@reservation.id}", ".pdf"], Rails.root.join('tmp'))
    tempfile.binmode
    tempfile.write pdf_string
    tempfile.close

    self.pdf = File.open tempfile.path
    self.pdf_file_name = "Reservation #{@reservation.id}.pdf"

    self.pdf_url = self.pdf.s3_object.url_for(:read, secure: true, expires: 90.days).to_s
    save

    tempfile.unlink
    
    respond_to do |format|
      format.pdf do
        render pdf: "Reservation #{@reservation.id}",
        page_size: 'A4',
        template: "reservations/pdf_invoice.html.erb",
        layout: nil,
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75,
        encoding: 'utf8'
      end
    end
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    debugger
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.json { render json: @reservation.errors.messages }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reservations_by_user
    @reservations = Reservation.includes(:appartment).where(
      user_id: params[:user_id], status: true
    )

    render :index
  end

  def check_in
    @reservation = Reservation.find(params[:id])

    @reservation.update_columns(check_in_date: DateTime.now, check_in: true)

    redirect_to edit_admin_user_path(@reservation.user_id)
  end

  def check_out
    @reservation = Reservation.find(params[:id])

    @reservation.update_columns(check_out_date: DateTime.now, check_out: true)

    redirect_to edit_admin_user_path(@reservation.user_id)
  end

  def reporting_excell
    @appartments = Appartment.all
    @users = User.all
    @reservations = Reservation.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="Reporte.xlsx"'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :appartment_id, :starting_date, :ending_date, :total_cost, :paid, :status)
  end
end
