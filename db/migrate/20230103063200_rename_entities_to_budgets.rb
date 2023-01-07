class RenameEntitiesToBudgets < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :budgets
    rename_table :groups, :categories
    drop_table :entity_x_groups
    create_join_table :budgets, :categories do |t|
      t.index :budget_id
      t.index :category_id
    end
  end
end
