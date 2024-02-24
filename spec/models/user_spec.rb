require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'password',
                     password_confirmation: 'password')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'associated entities should be destroyed' do
    @user.save
    @user.entities.create!(name: 'Example Entity')
    assert_difference 'Entity.count', -1 do
      @user.destroy
    end
  end

  test 'associated groups should be destroyed' do
    @user.save
    @user.groups.create!(name: 'Example Group')
    assert_difference 'Group.count', -1 do
      @user.destroy
    end
  end
end
