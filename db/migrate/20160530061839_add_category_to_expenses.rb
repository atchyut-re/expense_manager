class AddCategoryToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :category, index: true, foreign_key: true
  end
end
