class AddTypeToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :type, :string
  end
end
