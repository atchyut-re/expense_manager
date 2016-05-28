class CategoriesController < ApplicationController

	before_action :set_category, only: [:edit, :update, :destroy]
	
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
			flash[:success] = "New category created"
		else
			redirect_to new
		end
	end

	def edit
	end

	def update
		if @category.update_attributes(category_params)
			redirect_to categories_path
			flash[:success] = "Category updated successfully"
		else
			render 'edit'
		end
	end

	def destroy
	end

	def index
		@categories = Category.all
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end
