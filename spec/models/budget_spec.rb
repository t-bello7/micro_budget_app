require 'rails_helper'

RSpec.describe Budget, type: :model do
  #     context 'validations' do

  #     # it 'is valid with valid attributes' do
  #     #   expect(Entity.new(name: 'Rent', amount: 1000)).to be_valid
  #     # end
  #         it 'is not valid without a name' do
  #         expect(Entity.new(amount: 1000)).to_not be_valid
  #         end
  #         it 'is not valid without an amount' do
  #         expect(Entity.new(name: 'Rent')).to_not be_valid
  #         end
  #     end
  #   end

  context 'associations' do
    it 'should have many categories' do
      assc = described_class.reflect_on_association(:categories)
      expect(assc.macro).to eq :has_many
    end
  end
end
