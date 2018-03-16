class AddIndexToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_index :recipes, :name, unique: true
  end
end
