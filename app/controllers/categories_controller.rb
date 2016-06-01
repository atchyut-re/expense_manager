class CategoriesController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def new
		@category = Category.new
	end

	def create
		@user = current_user
		@category = @user.categories.create(category_params)
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
		if @category.destroy
		redirect_to categories_path
		end
	end

	def index
		@categories = current_user.categories
		@categories =  Kaminari.paginate_array(@categories).page(params[:page]).per(5)
	end

	def show
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :user_id)
	end

end
