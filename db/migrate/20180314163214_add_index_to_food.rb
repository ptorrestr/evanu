class AddIndexToFood < ActiveRecord::Migration[5.1]
  def change
    add_index :foods, :name, unique: true
  end
end
