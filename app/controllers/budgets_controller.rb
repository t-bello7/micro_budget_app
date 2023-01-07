class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_name = 'Transactions'
    @category = Category.find(params['category_id'])
    @budgets = @category.budgets
  end

  def new
    @page_name = 'Add New Transactions'
    @budget = Budget.new
  end

  def create
    # @category = Category.find(params['category_id'])
    @budget = Budget.new(**budget_params, user_id: current_user.id)
    if @budget.save
      redirect_to category_budgets_path
    else
      puts @budget.errors.full_messages
      redirect_to new_category_budget_path
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :amount, category_ids: [])
  end
end
