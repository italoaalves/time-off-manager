class UpdateVacationJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    current_year = Date.today.year
    User.joins(:vacations).where.not(vacations: { year: current_year.to_s }).where('extract(month from starting_date) = ?', Date.today.month).where(
      'extract(day from starting_date) <= ?', Date.today
    ).find_each do |user|
      vac = user.vacations.build(year: current_year.to_s, balance: ENV['VACATION_BALANCE'].to_i,
                                 expires_at: user.starting_date.change(year: 1.year.after.year.to_i))
      vac.save
    end
  end
end
