class IncomeController < ApplicationController
  def index
    @incomes = Income.where(user_id: current_user)
  end

  def new
    @income = Income.new
  end

  def show; end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: 'Renda Adicionada'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @income.update(income_params)
      redirect_to @income
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_path, notice: 'Renda Apagada com Sucesso'
  end

  private
  def income_params
    params.require(:income).permit(:value, :type)
  end
end
