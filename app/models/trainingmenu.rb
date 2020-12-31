class Trainingmenu < ApplicationRecord
  validates :name, { presence: true }

  has_many :trainingdetails, dependent: :destroy

  # def trainingdetails
  # 	return Trainingmenudetails.where(trainingmenu_id: self.id)
  # end

  # def trainings
  # 	return Training.where(id: Trainingmenudetails.where(trainingmenu_id: self.id).pluck(:training_id))
  # end
end
