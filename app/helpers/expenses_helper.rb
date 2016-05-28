module ExpensesHelper

	def current_day
	  date = Date.today
	end

	def current_month
	  date = Date.today
	  [date.beginning_of_month, date.end_of_month]
	end

	def last_month
	  date = Date.today - 1.month
	  [date.beginning_of_month, date.end_of_month]
	end

	def last_three_months
	  start_date = Date.today - 3.month
	  end_date = Date.today - 1.month
	  [start_date.beginning_of_month, end_date.end_of_month]
	end


	def last_six_months
	   start_date = Date.today - 6.month
	   end_date = Date.today - 1.month
	   [start_date.beginning_of_month, end_date.end_of_month]
    end


	def last_year
		date = Date.today - 1.year
	    [date.beginning_of_year, date.end_of_year]
	end
end
