class AddCategoryPartStrengthToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :strength, :integer
    add_column :trainings, :trainingcategory_id, :integer
    add_column :trainings, :bodypart_id, :integer
  end
end
