require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                         password_confirmation: 'password')
    @group = Group.create!(name: 'Example Group', author: @user)
    @entity = Entity.create!(name: 'Example Entity', amount: 100, category: @group, author: @user)
  end

  it 'is valid with valid attributes' do
    expect(@group).to be_valid
  end

  it 'is not valid without an author' do
    @group.author = nil
    expect(@group).to_not be_valid
  end

  it 'can calculate total amount of its entities' do
    expect(@group.total_amount).to eq(100)
  end
end
