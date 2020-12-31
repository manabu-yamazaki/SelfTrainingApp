class CreateAuthorities < ActiveRecord::Migration[6.0]
  def change
    create_table :authorities do |t|
      t.string :name

      t.timestamps
    end
  end
end
