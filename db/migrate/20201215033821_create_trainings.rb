class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :explanation
      t.string :image
      t.string :url
      t.integer :time
      t.timestamps
    end
  end
end
