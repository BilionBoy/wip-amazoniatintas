# frozen_string_literal: true
class LProdutosController < ApplicationController
  before_action :set_l_produto, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LProduto.ransack(params[:q])
    @pagy, @l_produtos = pagy(@q.result)
  end

  def new
    @l_produto = LProduto.new
  end

  def edit
  end

  def create
    @l_produto = LProduto.new(l_produto_params)

    if @l_produto.save
      redirect_to l_produtos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_produto.update(l_produto_params)
      redirect_to l_produtos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_produto.destroy
      redirect_to l_produtos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_produtos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_produto
    @l_produto = LProduto.find_by(id: params[:id])
    return redirect_to l_produtos_path, alert: t('messages.not_found') unless @l_produto
  end

  def l_produto_params
    permitted_attributes = LProduto.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_produto).permit(permitted_attributes.map(&:to_sym), :foto_produto, :remove_foto_produto)
  end

  def handle_not_found
    redirect_to l_produtos_path, alert: t('messages.not_found')
  end
end
