class Trainingmenu < ApplicationRecord
  before_validation :delete_if_training_id_blank
  belongs_to :user
  has_many :trainingmenudetails, inverse_of: :trainingmenu#, dependent: :destroy
  accepts_nested_attributes_for :trainingmenudetails, allow_destroy: true

  validates_associated :trainingmenudetails

  validates :name, presence: true
  validates :trainingmenudetails, presence: true

  def delete_if_training_id_blank
    trainingmenudetails.each{ |trainingmenudetail| trainingmenudetail.mark_for_destruction if trainingmenudetail.training_id.blank? || trainingmenudetail.order.blank? }
  end
end
