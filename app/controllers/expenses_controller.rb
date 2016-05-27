class ExpensesController < ApplicationController

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			redirect_to expenses_path
			flash[:success] = "New expence has been created"
		else
			render Expense.new
		end
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def update
		if @expense.update_attributes(expense_params)
			redirect_to expenses_path
			flas[:success] = "Expense has been updated"
		else
			render 'edit'
		end
	end

	def index
		@expenses = Expense.all
	end

	def destroy
		@expense = Expense.find(params[:id])
		if @expense.destroy
			flash[:success] = "expense deleted"
			redirect_to expenses_path
		else
			redirect_to expenses_path
		end
	end

	private

	def expense_params
		params.require(:expense).permit(:amount, :date, :category, :description)
	end
end
