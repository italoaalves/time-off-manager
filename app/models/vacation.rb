class Vacation < ApplicationRecord
  validates :year, :user, :expires_at, :balance, presence: true

  belongs_to :user
  has_many :off_times

  def expired?
    expires_at.to_datetime.past?
  end

  def has_balance(days)
    ((balance - days) + 1).positive?
  end

  def withdraw(days)
    self.balance -= days
  end

  def deposit(days)
    self.balance += days
  end
end
