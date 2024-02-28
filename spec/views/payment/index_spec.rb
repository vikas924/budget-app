require 'rails_helper'

RSpec.describe 'payments/index.html.erb', type: :view do
  before do
    @user = User.new(name: 'Bianca', email: 'b@example.com', password: '123456')
    @user.save
    @group = Group.new(author: @user, name: 'Nike', icon: 'icon_url')
    @group.save
    @payment2 = Payment.create(author: @user, name: 'Shoes', category: @group, amount: 120)
    @payment3 = Payment.create(author: @user, name: 'Shoes black', category: @group, amount: 20)
    assign(:group, @group)
    assign(:payments, Payment.all)
    render
  end

  it 'display' do
    expect(rendered).to have_text('Nike')

    expect(rendered).to have_selector('p', text: 'Shoes')
    expect(rendered).to have_selector('p', text: 'Shoes black')

    expect(rendered).to have_selector('p', text: '$ 120')
    expect(rendered).to have_selector('p', text: '$ 20')

    expect(rendered).to have_text('Create new transaction')
  end
end
