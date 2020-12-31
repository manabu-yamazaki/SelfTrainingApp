class CreateTrainingmenudetails < ActiveRecord::Migration[6.0]
  def change
    create_table :trainingmenudetails do |t|
      t.integer :trainingmenu_id
      t.integer :training_id
      t.integer :order

      t.timestamps
    end
  end
end
