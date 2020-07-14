class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  
  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def show; end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
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
    params.require(:income).permit(:income_type, :value)
  end

  def set_income
    @income = Income.find(params[:id])
  end
end
