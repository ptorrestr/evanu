class CreateKindergardens < ActiveRecord::Migration
  def change
    create_table :kindergardens do |t|
      t.string :name
      t.string :phone
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
