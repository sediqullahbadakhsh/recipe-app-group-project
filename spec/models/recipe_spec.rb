require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'sediq', email: 'sediq@gmail.com', password: '123456', confirmed_at: DateTime.now)
    @food = Food.new(name: 'apple', measurement_unit: 'kg', price: 120, user_id: @user.id)
    @user.save
    @food.save
  end
  subject do
    Recipe.new(user_id: @user.id, name: 'pizza', preparation_time: 1, cooking_time: 1, description: 'something',
               public: true)
  end
  before { subject.save }
  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a preparation time' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a cooking time' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
  end
end
