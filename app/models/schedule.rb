class Schedule < ApplicationRecord
  validates :user_id, { presence: true, uniquness: { scope: [:menu_id, :day_of_the_week, :time_zone] } }
  validates :menu_id, { presence: true }
  validates :day_of_the_week, { presence: true }
  validates :time_zone, { presence: true }

  def menu
    Trainingmenu.find_by(id: menu_id)
  end
end
