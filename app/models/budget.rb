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

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :amount,  numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
end
