class OffTimesController < ApplicationController
  before_action :set_off_time, only: %i[ show edit update destroy ]

  # GET /off_times or /off_times.json
  def index
    @off_times = OffTime.all
  end

  # GET /off_times/1 or /off_times/1.json
  def show
  end

  # GET /off_times/new
  def new
    @off_time = OffTime.new
  end

  # GET /off_times/1/edit
  def edit
  end

  # POST /off_times or /off_times.json
  def create
    @off_time = OffTime.new(off_time_params)

    respond_to do |format|
      if @off_time.save
        format.html { redirect_to off_time_url(@off_time), notice: "Off time was successfully created." }
        format.json { render :show, status: :created, location: @off_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @off_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /off_times/1 or /off_times/1.json
  def update
    respond_to do |format|
      if @off_time.update(off_time_params)
        format.html { redirect_to off_time_url(@off_time), notice: "Off time was successfully updated." }
        format.json { render :show, status: :ok, location: @off_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @off_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /off_times/1 or /off_times/1.json
  def destroy
    @off_time.destroy

    respond_to do |format|
      format.html { redirect_to off_times_url, notice: "Off time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_off_time
      @off_time = OffTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def off_time_params
      params.require(:off_time).permit(:vacation_id, :starts_at, :ends_at)
    end
end
