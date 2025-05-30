# frozen_string_literal: true
class LProfissionaisController < ApplicationController
  before_action :set_l_profissional, only: %i[show edit update destroy]
  before_action :carregar_especialidades, only: %i[new edit create update]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LProfissional.ransack(params[:q])
    @pagy, @l_profissionais = pagy(@q.result)
  end

  def new
    @l_profissional = LProfissional.new
  end

  def edit
  end

  def create
    @l_profissional = LProfissional.new(l_profissional_params)

    if @l_profissional.save
      redirect_to l_profissionais_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_profissional.update(l_profissional_params)
      redirect_to l_profissionais_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_profissional.destroy
      redirect_to l_profissionais_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_profissionais_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_profissional
    @l_profissional = LProfissional.find_by(id: params[:id])
    return redirect_to l_profissionais_path, alert: t('messages.not_found') unless @l_profissional
  end

  def l_profissional_params
    permitted_attributes = LProfissional.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_profissional).permit(permitted_attributes.map(&:to_sym), :foto_profissional, :remove_foto_profissional)
  end

  def handle_not_found
    redirect_to l_profissionais_path, alert: t('messages.not_found')
  end
  def carregar_especialidades
    @especialidades = LProfissional.especialidades_padrao
  end
end
