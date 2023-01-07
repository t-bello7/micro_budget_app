class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @page_name = 'Categories'
    @categories = current_user.categories
    # @total_amount = @categories.budgets
  end

  def new
    @page_name = 'Add New Category'
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
