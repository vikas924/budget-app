class PaymentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @payments = @group.payments.where(author_id: current_user).order(created_at: :desc)
  end

  def new
    @groups = Group.all.where(author: current_user.id)
    @group = Group.find(params[:group_id])
    @payment = Payment.new
  end

  def create
    @group = Group.find(params[:group_id])
    if params[:category_id] == '0'
      redirect_to new_group_payment_path(@group), notice: 'Category Not selected. Transaction not created'
    else
      @category = Group.find(params[:category_id])
      name = entity_params[:name]
      amount = entity_params[:amount]
      @payment = current_user.payments.build(name:, amount:)
      @category.payments << @payment

      if @payment.save
        redirect_to group_payments_path(@category), notice: 'Payment was successfully created.'
      else
        render :new, notice: 'Payment Not created.'
      end
    end
  end

  private

  def entity_params
    params.require(:payment).permit(:name, :amount, :category_id, :author_id)
  end
end
