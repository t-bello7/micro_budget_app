require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Solo Boss', password: '123456', email: 'soloboss@gmail.com')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Amount should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
