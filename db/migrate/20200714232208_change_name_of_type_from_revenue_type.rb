class ChangeNameOfTypeFromRevenueType < ActiveRecord::Migration[6.0]
  def change
    rename_column :revenues, :type, :revenue_type
  end
end
