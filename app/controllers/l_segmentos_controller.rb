# frozen_string_literal: true
class LSegmentosController < ApplicationController
  before_action :set_l_segmento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LSegmento.ransack(params[:q])
    @pagy, @l_segmentos = pagy(@q.result)
  end

  def new
    @l_segmento = LSegmento.new
  end

  def edit
  end

  def create
    @l_segmento = LSegmento.new(l_segmento_params)

    if @l_segmento.save
      redirect_to l_segmentos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_segmento.update(l_segmento_params)
      redirect_to l_segmentos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_segmento.destroy
      redirect_to l_segmentos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_segmentos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_segmento
    @l_segmento = LSegmento.find_by(id: params[:id])
    return redirect_to l_segmentos_path, alert: t('messages.not_found') unless @l_segmento
  end

  def l_segmento_params
    permitted_attributes = LSegmento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_segmento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to l_segmentos_path, alert: t('messages.not_found')
  end
end
