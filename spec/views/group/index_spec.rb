require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :view do
  before do
    @user = User.new(name: 'Bianca', email: 'b@example.com', password: '123456')
    @user.save
    @cat1 = Group.new(author: @user, name: 'Nike', icon: 'icon_url')
    @cat1.save
    @cat2 = Group.new(author: @user, name: 'Zara', icon: 'icon2_url')
    @cat2.save
    @payment1 = Payment.create(author: @user, name: 'Shirt', category: @cat2, amount: 35)
    @payment2 = Payment.create(author: @user, name: 'Shoes', category: @cat1, amount: 120)
    @payment3 = Payment.create(author: @user, name: 'Shoes', category: @cat1, amount: 20)
    assign(:groups, Group.all)
    render
  end

  it 'display' do
    expect(rendered).to have_text('Categories')

    expect(rendered).to have_selector('p', text: 'Nike')
    expect(rendered).to have_selector('p', text: 'Zara')

    expect(rendered).to have_selector('p', text: '$ 140')
    expect(rendered).to have_selector('p', text: '$ 35')

    expect(rendered).to have_text('Create new category')
  end
end
