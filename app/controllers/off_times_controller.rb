class OffTimesController < ApplicationController
  before_action :set_vacation
  before_action :set_off_time, only: %i[destroy]

  # GET /off_times/new
  def new
    @off_time = @vacation.off_times.build
  end

  # POST /off_times or /off_times.json
  def create
    @off_time = @vacation.off_times.build(off_time_params)
    @off_time.user = current_user

    respond_to do |format|
      if @off_time.valid?
        @vacation.withdraw(@off_time.days_count)
        @off_time.save
        @vacation.save
        format.html { redirect_to vacations_path, notice: 'Entry saved.' }
        format.json { render :show, status: :ok, location: @off_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @off_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /off_times/1 or /off_times/1.json
  def destroy
    @vacation.deposit(@off_time.days_count)
    @vacation.save
    @off_time.destroy
    respond_to do |format|
      format.html { redirect_to vacations_path, notice: 'Entry removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_off_time
    @off_time = OffTime.find(params[:id])
  end

  def set_vacation
    @vacation = Vacation.find(params[:vacation_id])
  end

  # Only allow a list of trusted parameters through.
  def off_time_params
    params.require(:off_time).permit(:starts_at, :ends_at)
  end
end
