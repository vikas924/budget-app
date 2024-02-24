require 'rails_helper'

RSpec.describe Entity, type: :model do
  before do
    @user = User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                         password_confirmation: 'password')
    @group = Group.create!(name: 'Example Group', author: @user)
    @entity = Entity.create!(name: 'Example Entity', amount: 100, category: @group, author: @user)
  end

  it 'is valid with valid attributes' do
    expect(@entity).to be_valid
  end

  it 'is not valid without an author' do
    @entity.author = nil
    expect(@entity).to_not be_valid
  end

  it 'is not valid without a category' do
    @entity.category = nil
    expect(@entity).to_not be_valid
  end
end
