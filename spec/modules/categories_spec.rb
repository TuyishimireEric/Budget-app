require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @current = User.create(name: 'eric', email: 'test@gmail.com', password: 'pw1234')
  end
  subject { Category.new(name: 'Food', icon: 'https://source.unsplash.com/random/100x100', user_id: @current.id) }

  before { subject.save }

  it 'Name is valid' do
    subject.name = 'Food'
    expect(subject).to be_valid
  end

  it 'Icon is valid' do
    subject.icon = 'https://source.unsplash.com/random/100x100'
    expect(subject).to be_valid
  end

  it 'Author is required' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Author should exist' do
    subject.user_id = 10
    expect(subject).to_not be_valid
  end
end
