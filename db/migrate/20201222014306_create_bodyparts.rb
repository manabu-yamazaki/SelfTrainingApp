class CreateBodyparts < ActiveRecord::Migration[6.0]
  def change
    create_table :bodyparts do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end