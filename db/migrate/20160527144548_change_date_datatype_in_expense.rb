class ChangeDateDatatypeInExpense < ActiveRecord::Migration
  def change
  	change_column :expenses, :date, :datetime
  end
end
