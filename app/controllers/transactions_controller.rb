class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @category = Category.find_by_id(params[:category_id])
    @transactions = []
    @category_id = params[:category_id]
    join = Transaction.where(category_id: @category_id)
    transaction_ids = join.pluck(:id)
    transaction_ids.map do |id|
      @transactions << Transaction.find(id)
    end
    @transactions = @transactions.sort_by(&:created_at).reverse
  end

  def new
    @transaction = Transaction.new
  end

  def create
    category = Category.find_by_id(params[:category_id])
    @transaction = category.transactions.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to category_transactions_path(category.id), notice: 'Transaction was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    # params.require(:transaction).permit(:name, :amount, :category_id).merge(user_id: current_user.id)
    params.require(:transaction).permit(:name, :amount, category_ids: []).merge(user_id: current_user.id)
  end
end
