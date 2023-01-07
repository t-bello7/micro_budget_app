require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    user = User.create(name: 'Chris', password: '123456', email: 'chris@gmail.com')
    @category = Category.new(name: 'Cars', user:)
    @category.icon.attach(io: File.open('./storage/test.png'), filename: 'test.png', content_type: 'image/png')
    sign_in user
  end

  context 'GET /index : ' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end
end
