class BudgetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @category = Category.find(params['category_id'])
        @budgets = @category.budgets
    end

    def new
        @budget = Budget.new
    end

    def create
        @category = Category.find(params['category_id'])

        @budget = @category.budgets.create(name: budget_params["name"], amount: budget_params["amount"], user_id: current_user.id)
        if @budget.save
            redirect_to category_budgets_path
        else
            puts @budget.errors.full_messages
            redirect_to new_category_budget_path
        end
    end

    private

    def budget_params
        params.require(:budget).permit(:name, :amount)
    end
end