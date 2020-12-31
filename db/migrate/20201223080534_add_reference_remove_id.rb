class AddReferenceRemoveId < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :authority_id
    remove_column :trainings, :user_id
    remove_column :trainings, :trainingcategory_id
    remove_column :trainings, :bodypart_id
    remove_column :trainingmenus, :user_id
    remove_column :trainingmenudetails, :trainingmenu_id
    remove_column :trainingmenudetails, :training_id
    remove_column :schedules, :user_id
    remove_column :schedules, :menu_id
    
    add_reference :users, :authority, foreign_key: true
    add_reference :trainings, :user, foreign_key: true
    add_reference :trainings, :trainingcategory, foreign_key: true
    add_reference :trainings, :bodypart, foreign_key: true
    add_reference :trainingmenus, :user, foreign_key: true
    add_reference :trainingmenudetails, :trainingmenu, foreign_key: true
    add_reference :trainingmenudetails, :training, foreign_key: true
    add_reference :schedules, :user, foreign_key: true
    add_reference :schedules, :trainingmenu, foreign_key: true
  end
end
