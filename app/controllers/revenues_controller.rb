class RevenuesController < ApplicationController
  before_action :set_revenue, only: [:show, :edit, :update, :destroy]
  
  def index
    @revenues = Revenue.where(user_id: current_user)
  end

  def new
    @revenue = Revenue.new
  end

  def show; end

  def create
    @revenue = Revenue.new(revenue_params)
    @revenue.user = current_user
    if @revenue.save
      redirect_to @revenue, notice: 'Entrada Adicionada'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @revenue.update(revenue_params)
      redirect_to @revenue
    else
      render :edit
    end
  end

  def destroy
    @revenue.destroy
    redirect_to revenues_path, notice: 'Entrada Apagada com Sucesso'
  end

  private

  def revenue_params
    params.require(:revenue).permit(:revenue_type, :values)
  end

  def set_revenue
    @revenue = Revenue.find(params[:id])
  end
end
