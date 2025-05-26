# frozen_string_literal: true
class LCategoriasController < ApplicationController
  before_action :set_l_categoria, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LCategoria.ransack(params[:q])
    @pagy, @l_categorias = pagy(@q.result)
  end

  def new
    @l_categoria = LCategoria.new
  end

  def edit
  end

  def create
    @l_categoria = LCategoria.new(l_categoria_params)

    if @l_categoria.save
      redirect_to l_categorias_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_categoria.update(l_categoria_params)
      redirect_to l_categorias_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_categoria.destroy
      redirect_to l_categorias_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_categorias_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_categoria
    @l_categoria = LCategoria.find_by(id: params[:id])
    return redirect_to l_categorias_path, alert: t('messages.not_found') unless @l_categoria
  end

  def l_categoria_params
    permitted_attributes = LCategoria.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_categoria).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to l_categorias_path, alert: t('messages.not_found')
  end
end
