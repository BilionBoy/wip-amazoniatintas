# frozen_string_literal: true
class TitulosController < ApplicationController
  before_action :set_titulo, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Titulo.ransack(params[:q])
    @pagy, @titulos = pagy(@q.result)
  end

  def new
    @titulo = Titulo.new
  end

  def edit
  end

  def create
    @titulo = Titulo.new(titulo_params)

    if @titulo.save
      redirect_to titulos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @titulo.update(titulo_params)
      redirect_to titulos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @titulo.destroy
      redirect_to titulos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to titulos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_titulo
    @titulo = Titulo.find_by(id: params[:id])
    return redirect_to titulos_path, alert: t('messages.not_found') unless @titulo
  end

  def titulo_params
    permitted_attributes = Titulo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:titulo).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to titulos_path, alert: t('messages.not_found')
  end
end
