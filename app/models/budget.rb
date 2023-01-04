# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  name       :string
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class Budget < ApplicationRecord
  belongs_to :user
  has_many :budgets_categories
  has_many :categoriess, through: :budgets_categories
end
