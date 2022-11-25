require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Eric', email: 'eric@gmail.com', password: 'password') }
  before { subject.save }

  it 'email is required' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email validation' do
    subject.email = 'a'
    expect(subject).to_not be_valid
  end

  it 'email validation' do
    subject.email = 'a@'
    expect(subject).to_not be_valid
  end

  it 'valid email' do
    subject.email = 'a@gmail'
    expect(subject).to be_valid
  end

  it 'Password length less than 6' do
    subject.email = '1'
    expect(subject).to_not be_valid
  end
end
