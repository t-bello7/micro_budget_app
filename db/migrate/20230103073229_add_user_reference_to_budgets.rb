class AddUserReferenceToBudgets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :budgets, :user, foreign_key:true
    add_reference :budgets, :user, null: false, foreign_key: true
  end
end
