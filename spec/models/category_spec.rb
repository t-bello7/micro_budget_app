require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.create(name: 'Solo Boss', password: '123456', email: 'soloboss@gmail.com')
    @category = Category.new(name: 'Cars', user:)
    @category.icon.attach(io: File.open('./storage/test.png'), filename: 'test.png', content_type: 'image/png')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'saves the icon' do
      expect(@category.icon).to be_attached
    end

    it 'Name should be valid' do
      expect(@category).to be_valid
    end

    it 'Name should be present' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'Icon should be present' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  context 'associations' do
    it 'should have many budgets' do
      assc = described_class.reflect_on_association(:budgets)
      expect(assc.macro).to eq :has_many
    end
  end
end
