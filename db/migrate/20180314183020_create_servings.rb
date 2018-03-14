class CreateServings < ActiveRecord::Migration[5.1]
  def change
    create_table :servings do |t|
      t.integer :net_weight
      t.integer :gross_weight
      t.string :unit
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
