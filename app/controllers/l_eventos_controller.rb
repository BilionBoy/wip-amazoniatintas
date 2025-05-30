# frozen_string_literal: true
class LEventosController < ApplicationController
  before_action :set_l_evento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LEvento.ransack(params[:q])
    @pagy, @l_eventos = pagy(@q.result)
  end

  def new
    @l_evento = LEvento.new
  end

  def edit
  end

  def create
    @l_evento = LEvento.new(l_evento_params)

    if @l_evento.save
      redirect_to l_eventos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_evento.update(l_evento_params)
      redirect_to l_eventos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_evento.destroy
      redirect_to l_eventos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_eventos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_evento
    @l_evento = LEvento.find_by(id: params[:id])
    return redirect_to l_eventos_path, alert: t('messages.not_found') unless @l_evento
  end

  def l_evento_params
    permitted_attributes = LEvento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_evento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to l_eventos_path, alert: t('messages.not_found')
  end
end
