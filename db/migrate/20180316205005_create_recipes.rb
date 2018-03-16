class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions
      t.references :level, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
