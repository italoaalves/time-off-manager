class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  enum role: %i[employee admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :vacations

  private

  def set_default_role
    self.role ||= :employee
  end
end
