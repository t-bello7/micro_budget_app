# == Schema Information
#
# Table name: budgets_categories
#
#  budget_id   :bigint           not null
#  category_id :bigint           not null
#
class BudgetsCategory < ApplicationRecord
    belongs_to :budget
    belongs_to :category
end
