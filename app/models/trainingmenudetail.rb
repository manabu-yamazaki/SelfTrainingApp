class Trainingmenudetail < ApplicationRecord
  validates :trainingmenu_id, uniqueness: { scope: [:training_id] }
  validates :training_id, { presence: true }
  validates :order, { presence: true, uniqueness: { scope: [:trainingmenu_id] } }

  belongs_to :trainingmenu
  belongs_to :training
end
