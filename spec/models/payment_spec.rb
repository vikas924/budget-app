require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @user = User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                         password_confirmation: 'password')
    @group = Group.create!(name: 'Example Group', author: @user)
    @payment = Payment.create!(name: 'Example payment', amount: 100, category: @group, author: @user)
  end

  it 'is valid with valid attributes' do
    expect(@payment).to be_valid
  end

  it 'is not valid without an author' do
    @payment.author = nil
    expect(@payment).to_not be_valid
  end

  it 'is not valid without a category' do
    @payment.category = nil
    expect(@payment).to_not be_valid
  end
end
