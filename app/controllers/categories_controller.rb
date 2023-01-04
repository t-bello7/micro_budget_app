class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = current_user.categories
    end
 
    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            redirect_to new_categories_path
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :icon)
    end
end