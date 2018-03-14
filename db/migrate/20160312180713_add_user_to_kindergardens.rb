class AddUserToKindergardens < ActiveRecord::Migration[5.1]
  def change
    add_reference :kindergardens, :user, index: true, foreign_key: true
  end
end
