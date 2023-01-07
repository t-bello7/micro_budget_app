require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    user = User.create(name: 'Dan Go', password: '123456', email: 'dan@gmail.com')
    @category = Category.new(id: 2, name: 'Cars', user:)
    @category.icon.attach(io: File.open('./storage/test.png'), filename: 'test.png', content_type: 'image/png')
    @category.save!
    # budget = @category.budgets.create(name: 'Toyota', amount: 100, user:)
    sign_in user
  end

  context 'GET /index : ' do
    before(:example) { get category_budgets_path(@category.id) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      expect(assigns(:budgets)).to eq(Budget.all)
    end
  end
end
