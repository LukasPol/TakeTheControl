class ChangeNameOfTypeFromSpendingType < ActiveRecord::Migration[6.0]
  def change
    rename_column :spendings, :type, :spending_type
  end
end
