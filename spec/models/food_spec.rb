require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(name: 'Andres', email: 'andres@gmail.com', password: '123456', confirmed_at: DateTime.now)
    @user.save
  end

  subject do
    Food.new(name: 'apple', measurement_unit: 'kg', price: 120, user_id: @user.id)
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a measurement unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
