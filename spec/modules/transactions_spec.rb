require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:example) do
    @current = User.create(name: 'eric', email: 'test@gmail.com', password: 'pw1234')
  end
  subject { Transaction.new(name: 'MacDonald Nugget', amount: 100, user_id: @current.id, category_id: 1) }

  before { subject.save }

  it 'Name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name is Valid' do
    subject.name = 'MacDonald Nugget'
    expect(subject).to_not be_valid
  end

  it 'Amount is required' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should be Int' do
    subject.amount = 50
    expect(subject).to_not be_valid
  end

  it 'user is required' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'user should exist' do
    subject.user_id = 10
    expect(subject).to_not be_valid
  end

  it 'user value should be Int and Exist' do
    subject.user_id = @current.id
    expect(subject).to_not be_valid
  end
end
