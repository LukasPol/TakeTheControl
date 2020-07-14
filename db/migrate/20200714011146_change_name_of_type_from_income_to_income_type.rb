class ChangeNameOfTypeFromIncomeToIncomeType < ActiveRecord::Migration[6.0]
  def change
    rename_column :incomes, :type, :income_type
  end
end
