# frozen_string_literal: true
class LTipoUsuariosController < ApplicationController
  before_action :set_l_tipo_usuario, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = LTipoUsuario.ransack(params[:q])
    @pagy, @l_tipo_usuarios = pagy(@q.result)
  end

  def new
    @l_tipo_usuario = LTipoUsuario.new
  end

  def edit
  end

  def create
    @l_tipo_usuario = LTipoUsuario.new(l_tipo_usuario_params)

    if @l_tipo_usuario.save
      redirect_to l_tipo_usuarios_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @l_tipo_usuario.update(l_tipo_usuario_params)
      redirect_to l_tipo_usuarios_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @l_tipo_usuario.destroy
      redirect_to l_tipo_usuarios_url, notice: t('messages.deleted_successfully')
    else
      redirect_to l_tipo_usuarios_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_l_tipo_usuario
    @l_tipo_usuario = LTipoUsuario.find_by(id: params[:id])
    return redirect_to l_tipo_usuarios_path, alert: t('messages.not_found') unless @l_tipo_usuario
  end

  def l_tipo_usuario_params
    permitted_attributes = LTipoUsuario.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:l_tipo_usuario).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to l_tipo_usuarios_path, alert: t('messages.not_found')
  end
end
