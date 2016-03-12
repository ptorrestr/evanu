class AddUserToKindergardens < ActiveRecord::Migration
  def change
    add_reference :kindergardens, :user, index: true, foreign_key: true
  end
end
