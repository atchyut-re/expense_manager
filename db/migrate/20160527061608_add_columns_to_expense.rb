class AddColumnsToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :amount, :integer
    add_column :expenses, :date, :string
    add_column :expenses, :category, :string
    add_column :expenses, :description, :text
  end
end
