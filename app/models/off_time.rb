class OffTime < ApplicationRecord
  validates :vacation, :user, :starts_at, :ends_at, presence: true

  belongs_to :vacation
  has_one :user, through: :vacation

  broadcasts_to :vacation
end
