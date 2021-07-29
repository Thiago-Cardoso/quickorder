require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  it 'is valid with quantitie' do
    product_order = create(:product_order)
    expect(product_order).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:quantitie)}
  end

  context 'Association' do
    it { is_expected.to belong_to(:product)}
    it { is_expected.to belong_to(:order)}
  end
end
