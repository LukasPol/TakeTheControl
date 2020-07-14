class AddUserToRevenue < ActiveRecord::Migration[6.0]
  def change
    add_reference :revenues, :user, null: false, foreign_key: true
  end
end
