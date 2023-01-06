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
  has_many :budgets_categories, dependent: :delete_all
  has_many :categories, through: :budgets_categories, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :amount,  numericality: true, comparison: { greater_than_or_equal_to: 0 }
end
