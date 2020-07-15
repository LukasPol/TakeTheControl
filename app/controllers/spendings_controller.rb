class SpendingsController < ApplicationController
  before_action :set_spending, only: [:show, :edit, :update, :destroy]

  def index
    @spendings = Spending.where(user_id: current_user)
  end

  def show; end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
    @spending.user = current_user
    if @spending.save
      redirect_to @spending, notice: 'Saída/Gasto Adicionado(a)'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @spending.update(spending_params)
      redirect_to @spending
    else
      render :edit
    end
  end

  def destroy
    if @spending.destroy
      redirect_to spendings_path, notice: 'Saída/Gasto Deletado(a) com sucesso!'
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:spending_type, :value)
  end

  def set_spending
    @spending = Spending.find(params[:id])
  end
end
