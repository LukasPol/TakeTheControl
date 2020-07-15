class AddSchoolingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :schooling, foreign_key: true
  end
end
