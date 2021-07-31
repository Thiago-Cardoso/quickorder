require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is valid with name,occupation ' do
    employee = create(:employee)
    expect(employee).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:occupation)}
  end
end

