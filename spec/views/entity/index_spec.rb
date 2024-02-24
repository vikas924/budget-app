require 'rails_helper'

RSpec.describe 'entities/index.html.erb', type: :view do
  before do
    @user = User.new(name: 'Bianca', email: 'b@example.com', password: '123456')
    @user.save
    @group = Group.new(author: @user, name: 'Nike', icon: 'icon_url')
    @group.save
    @entity2 = Entity.create(author: @user, name: 'Shoes', category: @group, amount: 120)
    @entity3 = Entity.create(author: @user, name: 'Shoes black', category: @group, amount: 20)
    assign(:group, @group)
    assign(:entities, Entity.all)
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
