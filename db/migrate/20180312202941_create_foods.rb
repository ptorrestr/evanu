class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :proteins
      t.decimal :carbohydrates
      t.decimal :fibre
      t.decimal :lipids
      t.decimal :saturated_fat
      t.decimal :price
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
