class VacationsController < ApplicationController
  before_action :set_vacation, only: %i[show edit update destroy]

  # GET /vacations or /vacations.json
  def index
    @vacations = current_user.vacations.all.order(:year).reverse_order
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vacation
    @vacation = Vacation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vacation_params
    params.require(:vacation).permit(:year, :user_id, :balance, :expires_at)
  end
end
