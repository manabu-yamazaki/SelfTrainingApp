class AddAuthorityIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authority_id, :integer
  end
end
