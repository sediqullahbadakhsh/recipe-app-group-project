require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.new(name: 'Andres', email: 'andres@gmail.com', password: '123456', confirmed_at: DateTime.now)
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
