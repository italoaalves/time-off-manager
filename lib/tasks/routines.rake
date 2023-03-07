namespace :routines do
  desc "Insert vacations on users"
  task update_vacations: :environment do
    UpdateVacationJob.perform_later
  end
end
