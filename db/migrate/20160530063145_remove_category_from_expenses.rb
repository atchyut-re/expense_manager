class RemoveCategoryFromExpenses < ActiveRecord::Migration
  def change
  	remove_column :expenses, :category
  end
end
