module ExpensesHelper

	def current_day
	  date = Date.today
	end

	def current_week
		date = Date.today
		[date.beginning_of_week, date.end_of_week]
	end

	def current_month
	  date = Date.today
	  [date.beginning_of_month, date.end_of_month]
	end

	def current_year
		date = Date.today
	    [date.beginning_of_year, date]
	end

	def sort_by_month(expenses)
		date = Date.today
		expenses.where(:created_at => date..date.end_of_month)
	end
end
