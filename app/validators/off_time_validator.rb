class OffTimeValidator < ActiveModel::Validator
  def validate(record)
    unless record.starts_at.nil? or record.ends_at.nil?
      unless has_balance(record)
        record.errors.add(:balance, 'not enough.')
      end
      if record.vacation.off_times.length <= 1
        if record.days_count < 15
          record.errors.add(:base, message: 'First time off must have 15 days.')
        end
      end
      unless minimum_range(record)
        record.errors.add(:base, message: 'Time off must have at least 5 days.')
      end
      if record.starts_at > record.ends_at
        record.errors.add(:base, message: 'Starting date must be before ending date.')
      end
      if record.starts_at <= Date.today
        record.errors.add(:base, message: 'Starting date must be in the future.')
      end
      if overlaping_dates(record)
        record.errors.add(:base, message: 'Starting date must be in the future.')
      end
    end
  end

  def has_balance(record)
    record.vacation.has_balance(record.days_count)
  end

  def minimum_range(record)
    record.days_count >= 5 or not record.vacation.off_times.length > 1
  end

  def overlaping_dates(record)

  end
end


