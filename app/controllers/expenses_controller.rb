class ExpensesController < ApplicationController
	include ExpensesHelper

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
		@expense = Expense.find(params[:id])
		if @expense.update_attributes(expense_params)
			redirect_to expenses_path
			flash[:success] = "Expense has been updated"
		else
			render 'edit'
		end
	end

	def index
		@expenses = current_user.expenses
		respond_to do |format|
	      format.html
	      format.xls
	  end
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

	def reports
	      from_date, to_date = current_month
	      @current_month_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

	      from_date, to_date = last_month
	      @last_month_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)
	       
	      from_date, to_date = last_three_months
	      @last_three_months_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

	      from_date, to_date = last_six_months
	      @last_six_months_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

	      from_date, to_date = last_year
	      @last_year_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)
           
        if params[:date_from].present? && params[:date_to].present?
	        date_from = Date.parse(params[:date_from])
	        date_to   = Date.parse(params[:date_to])
	        @range_expenses  = Expense.where('date BETWEEN ? AND ?', date_from.beginning_of_day, date_to.end_of_day)
        end      	      
    end

	private

	def expense_params
		params.require(:expense).permit(:amount, :date, :category_id, :description)
	end
end
