class OffTime < ApplicationRecord
  belongs_to :vacation
  has_one :user, through: :vacation
end
