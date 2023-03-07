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
        record.errors.add(:base, message: 'Dates are overlaping with previous entry.')
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
    clean_list = record.vacation.off_times.reject {|off_time| off_time.id == record.id }
    puts clean_list
    clean_list.each do |off_time|
      if record.starts_at.between?(off_time.starts_at, off_time.ends_at) or
         record.ends_at.between?(off_time.starts_at, off_time.ends_at)
        return true
      end
    end
    false
  end
end


