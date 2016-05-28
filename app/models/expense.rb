class Expense < ActiveRecord::Base
	belongs_to :categories
	belongs_to :users
end
