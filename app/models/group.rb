class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_payments
  has_many :payments, through: :group_payments

  def total_amount
    payments.sum(:amount)
  end
end
