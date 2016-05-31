class Category < ActiveRecord::Base
	belongs_to :user
	has_many :expenses

	validates :name , uniqueness: true
	validates :name , presence: true
end
