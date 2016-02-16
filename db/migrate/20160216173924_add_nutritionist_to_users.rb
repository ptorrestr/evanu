class AddNutritionistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nutritionist, :boolean, default: false
  end
end
