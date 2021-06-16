class Bodypart < ApplicationRecord
  validates :name, { presence: true }
end
