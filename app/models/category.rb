# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  icon       :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  belongs_to :user
  has_many :budgets_categories, dependent: :delete_all
  has_many :budgets, through: :budgets_categories, dependent: :delete_all
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :icon, attached: true, content_type: ['image/png', 'image/jpeg'],
                   size: { less_than: 1.megabytes, message: 'is too large' }
end
