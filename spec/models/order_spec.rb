require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with client_name,table_number,situation ' do
    order = create(:order)
    expect(order).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:client_name)}
    it { is_expected.to validate_presence_of(:table_number)}
    it { is_expected.to validate_presence_of(:situation)}
  end

  context 'Association' do
    it { is_expected.to belong_to(:employee)}
  end
end
