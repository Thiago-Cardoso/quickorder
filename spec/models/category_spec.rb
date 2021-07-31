require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with description' do
    category = create(:category)
    expect(category).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:description)}
  end

  context 'Association' do
    it { should have_many(:products)}
    end
end
