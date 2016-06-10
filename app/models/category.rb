class Category < ActiveRecord::Base
	belongs_to :user
	has_many :expenses
	default_scope { order("created_at DESC") }
	validates :name , uniqueness: true
	validates :name , presence: true
end
