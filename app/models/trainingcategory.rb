class Trainingcategory < ApplicationRecord
  validates :name, { presence: true }
end
