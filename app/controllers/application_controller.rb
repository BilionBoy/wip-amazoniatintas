class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend

  layout :determine_layout

  protected

  # Redireciona o usuário após login com base no tipo de usuário
  def after_sign_in_path_for(resource)
    return super unless resource.respond_to?(:l_tipo_usuario) && resource.l_tipo_usuario.present?

    case resource.l_tipo_usuario.descricao.to_s.downcase
    when 'administrador'
      l_tipo_usuarios_path
    when 'gerente'
      users_path
    when 'colaborador', 'funcionário'
      home_index_path
    else
      root_path
    end
  end

  private

  # Determina o layout com base no controller
  def determine_layout
    if devise_controller?
      'devise_application'
    elsif controller_path.start_with?('store')
      'home_application'
    else
      'application'
    end
  end
end
