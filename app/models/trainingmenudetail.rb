class Trainingmenudetail < ApplicationRecord
  validates :trainingmenu_id, { presence: true, uniquness: { scope: [:training_id] } }
  validates :training_id, { presence: true }
  validates :order, { presence: true }

  belongs_to :training
    # def training
    #     return Training.find_by(id: self.training_id)
    # end
end
