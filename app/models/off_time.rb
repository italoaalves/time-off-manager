class OffTime < ApplicationRecord
  validates_presence_of :vacation, :user, :starts_at, :ends_at
  validates_with OffTimeValidator

  belongs_to :vacation
  has_one :user, through: :vacation

  broadcasts_to :vacation

  def days_count
    (ends_at - starts_at).to_i + 1
  end

  def withdraw_balance
    vacation.withdraw(days_count)
  end
end
