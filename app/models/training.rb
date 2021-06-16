class Training < ApplicationRecord
  validates :name, { presence: true }
  validates :time, { presence: true }
  validates :strength, { presence: true }

  belongs_to :trainingcategory
  belongs_to :bodypart
  belongs_to :user
end
