class Expense < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	validates :amount, :category, :date, :description, presence: true
end
