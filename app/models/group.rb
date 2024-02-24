class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :payments, class_name: 'Payment', foreign_key: :category_id

  def total_amount
    payments.sum(:amount)
  end
end
