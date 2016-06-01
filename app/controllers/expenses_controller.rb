class ExpensesController < ApplicationController
	include ExpensesHelper
	before_action :authenticate_user!
	

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			redirect_to expenses_path
			flash[:success] = "New expence has been created"
		else
			redirect_to new_expense_path
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
		sort = params[:type]
		
    	if sort == 'date'
    		@expenses = current_user.expenses.where("date >= ?", Time.zone.now.beginning_of_day)
    	elsif sort == 'week'
    		@expenses = current_user.expenses.where("date >= ?", Time.zone.now.beginning_of_week)  		
    	elsif sort == 'month'
    		@expenses = current_user.expenses.where("date >= ?", Time.zone.now.beginning_of_month)
    	elsif sort == 'year'
    		@expenses = current_user.expenses.where("date >= ?", Time.zone.now.beginning_of_year)
    	else
    		@expenses = current_user.expenses
    	end
    	@expenses =  Kaminari.paginate_array(@expenses).page(params[:page]).per(5)
    	Rails.logger.debug "\nGETTING PARAMATERS----#{sort}\n"
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

		 from_date, to_date = current_week
	     @current_week_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

	      from_date, to_date = current_month
	      @current_month_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

	      from_date, to_date = current_month
	      @current_year_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

        if params[:date_from].present? && params[:date_to].present?
	        date_from = Date.parse(params[:date_from])
	        date_to   = Date.parse(params[:date_to])
	        @range_expenses  = Expense.where('date BETWEEN ? AND ?', date_from.beginning_of_day, date_to.end_of_day)
        end      	      
    end


    def expense_sort
    	sort = params[:type]
    	if sort == 'date'
    		@expenses = current_user.expenses.where(:created_at => Date.today)
    	elsif sort == 'month'
    	elsif sort == 'year'
    	end
    	Rails.logger.debug "\nGETTING PARAMATERS----#{sort}\n"
    end



	private

	def expense_params
		params.require(:expense).permit(:amount, :date, :category_id, :description)
	end
end
