class User < ApplicationRecord
  has_secure_password

  validates :name, { presence: true, uniqueness: true }

  belongs_to :authority

  has_many :schedules, dependent: :destroy
end
