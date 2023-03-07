class Vacation < ApplicationRecord
  belongs_to :user
  has_many :off_times
  
  def expired?
    expires_at.to_datetime.past?
  end
end
